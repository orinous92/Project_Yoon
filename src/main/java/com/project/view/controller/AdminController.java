package com.project.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.biz.board.BoardService;
import com.project.biz.board.BoardVO;
import com.project.biz.board.QnaService;
import com.project.biz.board.QnaVO;
import com.project.biz.member.MemberService;
import com.project.biz.member.MemberVO;
import com.project.biz.order.OrderService;
import com.project.biz.order.OrderVO;
import com.project.biz.paging.Criteria;
import com.project.biz.paging.PageMaker;
import com.project.biz.product.ProductService;
import com.project.biz.product.ProductVO;

@Controller
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private BoardService boardService;
	

	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String adminIndex() throws Exception{
		return "admin/index";
	}

	
	/*
	 *      
	 *     ADMIN : Product 기능
	 * 
	 */

	// admin_product_list
	
	@RequestMapping(value="admin_product_list")
	public String adminSearchProductList(Criteria cri, Model model, HttpSession session, @RequestParam(value="key", defaultValue="")String pname) throws Exception {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		System.out.println(pname);
		
		if(member.getGrade() == 1) {
			System.out.println(cri);
			System.out.println(pname);
			List<ProductVO> productList = productService.getListWithPaging(cri, pname);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			int totalCount = productService.productListCount(pname);
			pageMaker.setTotal(totalCount);
			System.out.println(pageMaker);
			
			model.addAttribute("productList", productList);
			model.addAttribute("productListSize", productList.size());
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/product/productList";
		} else {
			return "index";
		}
		
	}
	
	// admin_product_write_form
	
	@RequestMapping(value="admin_product_write_form")
	public String adminProductWriteForm(HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			String cateList[] = { "Motorcycle", "Helmet", "Equipment" };
			model.addAttribute("cateList", cateList);
			
			return "admin/product/register";
		} else {
			return "member/signin";
		}
		
	}
	
	// admin_product_write
	
	@RequestMapping(value="admin_product_write", method=RequestMethod.POST)
	public String adminProductWriteAction(@RequestParam(value="uploadFile", required = false)MultipartFile file, ProductVO pVo, HttpSession session, Model model) throws IOException {
		
		String fileName = "";
		
		if(!file.isEmpty()) {
			fileName = file.getOriginalFilename();
			
			String path = "D:\\Bike-WorkSpace\\Bike_Project\\src\\main\\webapp\\WEB-INF\\resources\\img\\uploadImg\\";
			
			try {
				new File(path).mkdirs(); 
				file.transferTo(new File(path + fileName));
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			pVo.setImage(fileName);
			
			System.out.println(pVo);
			
			productService.register(pVo);
		}
		
		return "redirect:admin_product_list";
	}
	
	// admin_product_detail
	
	@RequestMapping(value="admin_product_detail", method=RequestMethod.GET)
	public String adminProductView(@RequestParam("pno")int pno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
			
		ProductVO product = productService.productView(pno);
		
		model.addAttribute("productVO", product);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/product/productDetail";
	}
	
	// admin_product_modify
	
	@RequestMapping(value="admin_product_modify_form")
	public String adminProductModifyView(ProductVO pVo, Model model) throws Exception {
		
		ProductVO vo = productService.getProduct(pVo.getPno());
		
		String cateList[] = { "Motorcycle", "Helmet", "Equipment" };
		
		model.addAttribute("cateList", cateList);
		
		model.addAttribute("productVO", vo);
		
		return "admin/product/productModify";
		
	}
	
	@RequestMapping(value = "admin_product_modify")
	public String adminProductModifyAction(@RequestParam(value="product_image") MultipartFile uploadFile, ProductVO pVo, Model model, HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			
			String fileName = "";
			
			if(pVo.getUseyn() == null) {
				pVo.setUseyn("n");
			}
			
			if(!uploadFile.isEmpty()) {
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/img/uploadImg/");
				System.out.println("Root =" + root_path);
				
				fileName = uploadFile.getOriginalFilename();
				
				try {
					File file = new File(root_path + fileName);
					uploadFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				pVo.setImage(fileName);
			}
			
			System.out.println(pVo);
			productService.updateProduct(pVo);
			
			return "redirect:admin_product_detail?pno=" + pVo.getPno();
			
		} else {
			return "member/signin";
		}
	}
	
	/*
	 * 
	 *  ADMIN : User 기능
	 * 
	 */
	
	// admin_user_list
	
	@RequestMapping(value="admin_user_list", method=RequestMethod.GET)
	public String adminUserList(MemberVO mVo , Model model, HttpSession session, @RequestParam(value="key", defaultValue="")String userid, Criteria cri) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {

			List<MemberVO> userList = memberService.getUserListWithPaging(cri, userid);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			int TotalCount = memberService.memberListCount(userid);
			pageMaker.setTotal(TotalCount);
			

			model.addAttribute("userList", userList);
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/member/userList";
			
		} else {
			
			return "member/signin";
		}
		
	}
	
	
	
	/*
	 * 
	 * 	ADMIN : Order 기능
	 * 
	 */
	
	
	@RequestMapping(value="admin_order_list", method = RequestMethod.GET)
	public String adminOrderList(Model model, HttpSession session, OrderVO oVo,
					@RequestParam(value="key", defaultValue = "")String key) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			oVo.setMname(key);
			List<OrderVO> orderList = orderService.listOrder(oVo);
			model.addAttribute("orderList", orderList);

			return "admin/order/orderList";
		} else {
			return "member/signin";
		}
		
	}
	
	@RequestMapping(value="admin_order_list", method = RequestMethod.POST)
	public String adminOrderListSearch(Model model, HttpSession session, OrderVO oVo,
					@RequestParam(value="key", defaultValue = "")String key) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			oVo.setMname(key);
			List<OrderVO> orderList = orderService.listOrder(oVo);
			model.addAttribute("orderList", orderList);

			return "admin/order/orderList";
		} else {
			return "member/signin";
		}
		
	}
	
	@RequestMapping(value="admin_order_save")
	public String adminOrderSave(HttpSession session, OrderVO oVo, Model model,
					@RequestParam(value="result")int odno[]) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			for(int i = 0; i < odno.length; i++) {
				oVo.setOdno(odno[i]);
				orderService.updateOrderResult(oVo);
			}
			
			return "redirect:admin_order_list";
		} else {
			return "member/signin";
		}
	}
	
	/*
	 * 
	 * 		ADMIN : QNA 기능
	 * 
	 */
	
	@RequestMapping(value="admin_qna_list")
	public String adminQnaList(HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			
			List<QnaVO> qnaList = qnaService.listAllQna();
			model.addAttribute("qnaList", qnaList);
			
			return "admin/qna/qnaList";
		} else {
			return "member/signin";
		}
	}
	
	@RequestMapping(value="admin_qna_detail")
	public String adminQnaDetail(HttpSession session, Model model, @RequestParam("qno")int qno) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			
			QnaVO qVo = qnaService.getQna(qno);
			model.addAttribute("qnaVO", qVo);
			
			return "admin/qna/qnaDetail";
		} else {
			
			return "member/signin";
		}
	}
	
	@RequestMapping(value="admin_qna_resave")
	public String adminQnaResave(HttpSession session, QnaVO qVo) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			
			qnaService.updateQna(qVo);
			
			return "redirect:admin_qna_list";
		} else {
			
			return "member/signin";
		}
	}
	
	/*
	 * 
	 * 		ADMIN : board 기능
	 * 
	 */
	

	
	@RequestMapping(value="admin_notice_list")
	public String adminNoticeList(BoardVO bVo, Model model, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() ==1) {
			
			List<BoardVO> noticeList = boardService.noticeList();
			model.addAttribute("noticeList", noticeList);
			
			return "admin/board/noticeList";
		} else {
			return "member/signin";
		}
		
	}
	
	@RequestMapping(value="admin_notice_write")
	public String adminNoticeWrite(BoardVO bVo, Model model) {
		
		return "admin/board/noticeWrite";
	}
	
	@RequestMapping(value="admin_notice_write", method=RequestMethod.POST)
	public String adminNoticeWriteAction(BoardVO bVo, Model model) {
		
		System.out.println(bVo);
		boardService.insertBoard(bVo);
		
		return "redirect:admin_notice_list";
	}
	
	@RequestMapping(value="admin_notice_detail")
	public String noticeBoardView(BoardVO bVo, HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() == 1) {
			
			BoardVO vo = boardService.getBoard(bVo.getBno());
			model.addAttribute("notice", vo);
			
			boardService.viewCount(bVo.getBno());
			
			return "admin/board/noticeDetail";
		} else {
			return "member/signin";
		}
	}
	
	@RequestMapping(value="admin_notice_delete")
	public String noticeDeleteBoard(BoardVO bVo, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member.getGrade() ==1) {
			
			boardService.deleteNotice(bVo.getBno());
			
			return "redirect:admin_notice_list";
		} else {
			return "member/signin";
		}
	}
}

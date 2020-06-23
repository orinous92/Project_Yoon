package com.project.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.biz.member.MemberService;
import com.project.biz.member.MemberVO;
import com.project.biz.order.CartService;
import com.project.biz.order.CartVO;
import com.project.biz.order.OrderService;
import com.project.biz.order.OrderVO;

@Controller
public class MyPageController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	// mypage - cartList view
	@RequestMapping(value="cart_list", method=RequestMethod.GET)
	public String cartList(Model model, HttpSession session) {
		
		String result = "";
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		if(user != null) {
			List<CartVO> cartList = cartService.cartList(user.getUserid());
			
			int total = 0;
			for(CartVO cart : cartList) {
				total += cart.getPrice() * cart.getQuantity();
			}
			
			model.addAttribute("cartList", cartList);
			model.addAttribute("totalPrice" , total);
			
			result = "order/cartList";
			
		} else {
			
			result = "member/signin";
			
		}
		
		return result;
	}
	
	// mypage - insert cart
	@RequestMapping(value="cart_insert" , method=RequestMethod.POST)
	public String insertCart(CartVO cVo, HttpSession session) {
		
		String result = "";
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			
			cVo.setUserid(member.getUserid());
			
			cartService.insertCart(cVo);
			
			result = "redirect:cart_list";

		} else {
			
			result = "member/signin";
		}
		
		return result;
	}
	
	// mypage - cart update
	@RequestMapping(value="cart_update", method = RequestMethod.POST)
	public String cartUpdate(CartVO cVo) {
		
		cartService.updateCart(cVo.getCno());
		
		return "mypage/cartList";
	}
	
	// mypage - cart delete
	@RequestMapping(value="cart_delete", method = RequestMethod.POST)
	public String cartDelete(@RequestParam(value="select")int[] cno,CartVO cVo, Model model) {
		
		for(int i = 0; i < cno.length; i++) {
			cVo.setCno(cno[i]);
			cartService.deleteCart(cVo.getCno());
		}
		
		return "redirect:cart_list";
	}
	
	// mypage - order insert
	@RequestMapping(value="order_insert", method = RequestMethod.POST)
	public String orderInsert(OrderVO oVo, HttpSession session, Model model) {
		
		String result = "";
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {
			
			oVo.setUserid(member.getUserid());
			System.out.println(oVo);
			
			int ono = orderService.insertOrder(oVo);
			
			oVo.setResult("1");
			model.addAttribute("ono", ono);
			
			result = "redirect:order_list";
			
		} else {
			result = "member/signin";
		}
		return result;
	}
	
	// mypage - orderList
	@RequestMapping(value = "order_list", method = RequestMethod.GET)
	public String orderList(@RequestParam(value = "ono") int ono, Model model, HttpSession session) throws Exception {
		
		String result = "";
		
		MemberVO member = (MemberVO)session.getAttribute("member");

		if(member != null) {
			
			OrderVO oVo = new OrderVO();
			oVo.setUserid(member.getUserid());
			oVo.setOno(ono);
			oVo.setResult("1");
			
			System.out.println(oVo);
			
			List<OrderVO> orderList = orderService.listOrderById(oVo);
			
			System.out.println(orderList);
			
			int total = 0;
			
			for (OrderVO orderVO : orderList) {
				total += orderVO.getPrice();
			}
			
			model.addAttribute("orderList", orderList);
			model.addAttribute("totalPrice", total);
			
			result = "order/orderList";
		} else {
			result = "member/signin";
		}
		return result;
	}
	
	
	
	//mypage - list : mypage
	@RequestMapping(value="my_order_page", method = RequestMethod.GET)
	public String myOrderPage(HttpSession session, Model model, OrderVO oVo) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String result = "";
		
		if(member != null) {
			
			List<Integer> onoList = orderService.selectNoOrdering(member.getUserid());
			
			List<OrderVO> orderList = new ArrayList<OrderVO>();
			
			for(int ono : onoList) {
				
				oVo.setUserid(member.getUserid());
				oVo.setOno(ono);
				oVo.setResult("1");
				
				List<OrderVO> listByNo = orderService.listOrderById(oVo);
				
				OrderVO vo = new OrderVO();
				vo.setIndate(listByNo.get(0).getIndate());
				vo.setOno(listByNo.get(0).getOno());
				
				if(listByNo.size() > 1) {
					vo.setPname(listByNo.get(0).getPname() + " 외 " + (listByNo.size() - 1) + "건");
				} else {
					vo.setPname(listByNo.get(0).getPname());
				}
				
				int totalPrice = 0;
				
				for(int i = 0; i< listByNo.size(); i++) {
					totalPrice += listByNo.get(i).getPrice() * listByNo.get(i).getQuantity();
				}
				
				vo.setPrice(totalPrice);
				
				orderList.add(vo);
				
				model.addAttribute("title", "주문 내역 조회 페이지");
				model.addAttribute("orderList", orderList);
			}
			
			result = "order/myOrderPage";
			
		} else {
			
			result = "member/signin";
		}
		
		return result;
	}
	
	// my page - order_detail
	@RequestMapping(value="order_detail" , method = RequestMethod.GET)
	public String orderDetailView(OrderVO oVo, Model model, HttpSession session) {
		
		String result = "";
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			oVo.setUserid(member.getUserid());
			oVo.setResult("1");
			
			List<OrderVO> orderList = orderService.listOrderById(oVo);
			
			
			int totalPrice = 0;
			
			for(int i = 0; i < orderList.size(); i++) {
				totalPrice += orderList.get(i).getPrice() * orderList.get(i).getQuantity();
			}
			
			model.addAttribute("orderList", orderList);
			model.addAttribute("orderDetail", orderList.get(0));
			model.addAttribute("totalPrice", totalPrice);
			
			result ="order/orderDetail";
	
		} else {
			
			result = "member/signin";
			
		}
		
		return result;
		
	}
	
	// my page - profile
	@RequestMapping(value="profile", method = RequestMethod.GET)
	public String profileView(MemberVO mVo, Model model, HttpSession session) {
		
		String result = "";
		
		System.out.println(mVo);
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			System.out.println(member);
			model.addAttribute("memberVO", member);
			
			result = "order/profile";
			
		} else {
			
			result = "member/signin";
		}
		
		return result;
		
	}
	
	@RequestMapping(value="modify_user", method = RequestMethod.GET)
	public String modifyUserView() {
		return "order/modify";
	}
	
	@RequestMapping(value="modify_user", method = RequestMethod.POST)
	public String modifyUserAction(MemberVO mVo, Model model, @RequestParam(value="phone1", required=false)String phone1,
															  @RequestParam(value="phone2", required=false)String phone2,
															  @RequestParam(value="phone3", required=false)String phone3,
															  @RequestParam(value="grade", required=false)int grade) throws Exception {
		
		
		mVo.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		
		
		System.out.println(mVo);
		memberService.updateMember(mVo);
	
		model.addAttribute("member");
		
		return "order/mypage";
	}
	
	@RequestMapping(value="delete_user", method=RequestMethod.POST)
	public String deleteMember(MemberVO mVo) {
		
		System.out.println(mVo.getUserid());
		memberService.deleteMember(mVo.getUserid());
		
		return "index";
	}
}

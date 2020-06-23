package com.project.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.biz.board.BoardService;
import com.project.biz.board.BoardVO;
import com.project.biz.board.Board_CommentVO;
import com.project.biz.member.MemberVO;
import com.project.biz.product.CommentVO;
import com.project.biz.product.ProductService;


@Controller
public class CommentController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="product_comment_insert", method=RequestMethod.POST)
	@ResponseBody
	public String insertComment(CommentVO cVo, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		System.out.println("cVo:"+cVo);
		
		if(member != null) {
			
			String userid = member.getUserid();
			
			cVo.setWriter(userid);
			productService.insertComment(cVo);
			
			return("success");
			
		} else {
			
			return("fail");
			
		}
	}
	
	@RequestMapping(value="comment_list", method=RequestMethod.GET)
	@ResponseBody
	public List<CommentVO> getCommentList(CommentVO cVo, Model model, HttpSession session){
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		int pno = cVo.getPno();
		
		System.out.println(pno);
		
		List<CommentVO> commentList = productService.getCommentList(pno);
		
		return commentList;
	}
	
	@RequestMapping(value="comment_delete", method = RequestMethod.GET)
	public String deleteComment(HttpSession session, CommentVO cVo) {
		
		productService.deleteComment(cVo.getComment_no());
		System.out.println("delete 기능 처리");
		
		return "redirect:product_view?pno=" + cVo.getPno();
	}
	
	
	
	@RequestMapping(value="board_comment_insert", method=RequestMethod.POST)
	@ResponseBody
	public String insertBoardComment(Board_CommentVO bVo, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		System.out.println("bVo: " + bVo);
		if(member != null) {
			
			String userid = member.getUserid();
			
			bVo.setWriter(userid);
			boardService.insertBoardComment(bVo);
			
			//System.out.println(bVo);
			
			return("success");
			
		} else {
			
			return("fail");
			
		}
	}
	
	
	
	@RequestMapping(value="board_comment_list", method=RequestMethod.GET)
	@ResponseBody
	public List<Board_CommentVO> BoardCommentList(BoardVO bVo, Model model, HttpSession session){
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		System.out.println("Bno:"+bVo.getBno());
		
		int bno = bVo.getBno();
		
		List<Board_CommentVO> boardCommentList = boardService.boardCommentList(bno);
		
		return boardCommentList;
	}
	
	@RequestMapping(value="board_comment_delete", method = RequestMethod.GET)
	public String deleteComment(HttpSession session, Board_CommentVO bVo) {
		
		productService.deleteComment(bVo.getComment_no());
		System.out.println("delete 기능 처리");
		
		return "redirect:board_detail?bno=" + bVo.getBno();
	}
	
	
}

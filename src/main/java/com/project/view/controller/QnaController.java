package com.project.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.biz.board.QnaService;
import com.project.biz.board.QnaVO;
import com.project.biz.member.MemberVO;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
		
	@RequestMapping(value="qna_list")
	public String qnaList(Model model, QnaVO qVo, HttpSession session) {
		
		String result = "";
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			
			List<QnaVO> qnaList = qnaService.listQna(member.getUserid());
			
			model.addAttribute("qnaList", qnaList);
			
			result = "board/qnaList";
			
		} else {
			
			result = "member/signin";
		}
		
		return result;
	}
	
	// register form
	@RequestMapping(value="qna_register")
	public String qnaWriteView() {
		return "board/qnaWrite";
	}
	
	@RequestMapping(value="qna_register", method=RequestMethod.POST)
	public String qnaWriteView(QnaVO qVo, Model model, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String result = "";
		
		if(member != null) {
			qVo.setUserid(member.getUserid());
			
			qnaService.insertQna(qVo);
			
			result ="redirect:qna_list";
			
		} else {
			result ="member/signin";
		}
		
		return result;
	}
	
	// qna_detail
	@RequestMapping(value="qna_detail")
	public String qnaDetailView(@RequestParam(value="qno", required=false)int qno, QnaVO qVo, Model model, HttpSession session) {
		
		String result = "";
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			
			QnaVO vo = qnaService.getQna(qno);
			
			model.addAttribute("qnaVO", vo);
			
			result = "board/qnaDetail";
		} else {
			result = "member/signin";
		}
		
		return result;
		
	}
	
}

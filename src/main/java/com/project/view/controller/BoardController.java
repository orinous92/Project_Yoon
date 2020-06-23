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
import com.project.biz.member.MemberVO;
import com.project.biz.paging.Criteria;
import com.project.biz.paging.PageMaker;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	
	@RequestMapping(value="board_list", method=RequestMethod.GET)
	public String boardListWithPaging(@ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		
		List<BoardVO> boardList = boardService.listBoardWithPaging(cri);
		
		model.addAttribute("boardList", boardList);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotal(boardService.listCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="board_register", method=RequestMethod.GET)
	public String boardWriteForm(HttpSession session,BoardVO bVo, Model model) {
		
		String result = "";
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			model.addAttribute("member", member);
			result = "board/boardWrite";
		} else {
			result = "member/signin";
		}
		
		return result;
		
	}
	
	@RequestMapping(value="board_register", method=RequestMethod.POST)
	public String boardWriteAction(BoardVO bVo, Model model, @RequestParam(value="uploadFile")MultipartFile file) throws IOException {
		
		if(!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			bVo.setImage(fileName);
			file.transferTo(new File("D:\\Bike-WorkSpace\\Bike_Project\\src\\main\\webapp\\WEB-INF\\resources\\img\\uploadImg" + fileName));
			boardService.insertBoard(bVo);
			System.out.println(bVo);
		}
		
		return "redirect:board_list";
	}
	
	@RequestMapping(value="board_detail", method=RequestMethod.GET)
	public String boardDetail(HttpSession session, Model model, BoardVO bVo) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		BoardVO board = boardService.getBoard(bVo.getBno());
		
		boardService.viewCount(bVo.getBno());
		
		System.out.println(board);
		System.out.println(bVo.getBno());
		
		model.addAttribute("boardVO", board);
		model.addAttribute("member", member);
		
		
		return "board/boardDetail";
		
	}
	
	@RequestMapping(value="board_modify", method=RequestMethod.GET)
	public String boardModifyView(BoardVO bVo, Model model, HttpSession session) {
		
		String result = "";
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			model.addAttribute("member", member);
			BoardVO board = boardService.getBoard(bVo.getBno());
			model.addAttribute("boardVO", board);
			
			result = "board/boardModify";
		} else {
			result = "member/signin";
		}
		
		return result;
	}
	
	@RequestMapping(value="board_modify", method=RequestMethod.POST)
	public String boardModifyAction(BoardVO bVo, @RequestParam(value="title", required=false)String title,
												 @RequestParam(value="content", required=false)String content) {

		bVo.setTitle(title);
		bVo.setContent(content);
		
		boardService.updateBoard(bVo);

		return "redirect:board_detail?bno="+ bVo.getBno();		
	}
	
	@RequestMapping(value="board_delete", method=RequestMethod.GET)
	public String deleteBoardAction(BoardVO bVo, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			bVo.setUseyn("n");
			boardService.deleteBoard(bVo.getBno());
			System.out.println(bVo);
			return "redirect:board_list";
		} else {
			return "member/signin";
		}
	}
	
	// notice
	@RequestMapping(value="notice_list")
	public String adminBoardNotice(BoardVO bVo, Model model) {
		
		List<BoardVO> noticeList = boardService.noticeList();
				
		model.addAttribute("noticeList", noticeList);
		
		return "board/notice";
	}
	
	@RequestMapping(value="notice_detail")
	public String noticeBoardView(BoardVO bVo, HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			
			BoardVO vo = boardService.getBoard(bVo.getBno());
			model.addAttribute("notice", vo);
			
			boardService.viewCount(bVo.getBno());
			
			return "board/noticeDetail";
		} else {
			return "member/signin";
		}
	}

	
}

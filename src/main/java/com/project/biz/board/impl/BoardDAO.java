package com.project.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.biz.board.BoardVO;
import com.project.biz.board.Board_CommentVO;
import com.project.biz.paging.Criteria;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBoard(BoardVO bVo) {
		mybatis.insert("BoardDAO.insertBoard",bVo);
	}

	public void updateBoard(BoardVO bVo) {
		mybatis.update("BoardDAO.updateBoard", bVo);
	}

	public void deleteBoard(int bno) {
		mybatis.delete("BoardDAO.deleteBoard", bno);
	}

	public BoardVO getBoard(int bno) {
		return mybatis.selectOne("BoardDAO.getBoard",bno);
	}

	public void viewCount(int bno) {
		mybatis.update("BoardDAO.viewCount",bno);
	}

	public List<BoardVO> listBoardWithPaging(Criteria cri) {
		return mybatis.selectList("BoardDAO.listBoardWithPaging", cri);
	}

	public int listCount(Criteria cri) {
		return mybatis.selectOne("BoardDAO.listCount", cri);
	}

	public List<BoardVO> noticeList() {
		return mybatis.selectList("BoardDAO.noticeList");
	}

	public void deleteNotice(int bno) {
		mybatis.delete("BoardDAO.deleteNotice", bno);
	}

	public List<Board_CommentVO> boardCommentList(int bno) {
		return mybatis.selectList("CommentDAO.boardCommentList",bno);
	}

	public void insertBoardComment(Board_CommentVO bVo) {
		mybatis.insert("CommentDAO.insertBoardComment", bVo);
	}

	public void updateBoardComment(Board_CommentVO bVo) {
		mybatis.update("CommentDAO.updateBoardComment", bVo);
	}

	public void deleteBoardComment(int comment_no) {
		mybatis.delete("CommentDAO.deleteBoardComment", comment_no);
	}
	
}

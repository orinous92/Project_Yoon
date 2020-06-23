package com.project.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.biz.board.BoardService;
import com.project.biz.board.BoardVO;
import com.project.biz.board.Board_CommentVO;
import com.project.biz.paging.Criteria;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDao;
	
	@Override
	public void insertBoard(BoardVO bVo) {
		bDao.insertBoard(bVo);
	}

	@Override
	public void updateBoard(BoardVO bVo) {
		bDao.updateBoard(bVo);
	}

	@Override
	public void deleteBoard(int bno) {
		bDao.deleteBoard(bno);
	}

	@Override
	public BoardVO getBoard(int bno) {
		return bDao.getBoard(bno);
	}

	@Override
	public void viewCount(int bno) {
		bDao.viewCount(bno);
	}

	@Override
	public List<BoardVO> listBoardWithPaging(Criteria cri) {
		return bDao.listBoardWithPaging(cri);
	}

	@Override
	public int listCount(Criteria cri) throws Exception {
		return bDao.listCount(cri);
	}

	@Override
	public List<BoardVO> noticeList() {
		return bDao.noticeList();
	}

	@Override
	public void deleteNotice(int bno) {
		bDao.deleteNotice(bno);
	}

	// Board Comment
	
	@Override
	public List<Board_CommentVO> boardCommentList(int bno) {
		return bDao.boardCommentList(bno);
	}

	@Override
	public void insertBoardComment(Board_CommentVO bVo) {
		bDao.insertBoardComment(bVo);
	}

	@Override
	public void updateBoardComment(Board_CommentVO bVo) {
		bDao.updateBoardComment(bVo);
	}

	@Override
	public void deleteBoardComment(int comment_no) {
		bDao.deleteBoardComment(comment_no);		
	}

}

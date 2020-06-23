package com.project.biz.board;

import java.util.List;

import com.project.biz.paging.Criteria;


public interface BoardService {
	
	public void insertBoard(BoardVO bVo);
	
	public void updateBoard(BoardVO bVo);
	
	public void deleteBoard(int bno);
	
	public BoardVO getBoard(int bno);

	public void viewCount(int bno);
	
	List<BoardVO> listBoardWithPaging(Criteria cri);
	
	public int listCount(Criteria cri) throws Exception;
	
	List<BoardVO> noticeList();
	
	public void deleteNotice(int bno);
	
	/*
	 *  게시판 댓글 기능
	 */
	
	List<Board_CommentVO> boardCommentList(int bno);
	void insertBoardComment(Board_CommentVO bVo);
	void updateBoardComment(Board_CommentVO bVo);
	void deleteBoardComment(int comment_no);
}

package com.project.biz.board;

import java.util.List;

public interface QnaService {
	
	List<QnaVO> listQna(String userid);
	List<QnaVO> listAllQna();
	QnaVO getQna(int qno);
	void insertQna(QnaVO qVo);
	void updateQna(QnaVO qVo);
	
}

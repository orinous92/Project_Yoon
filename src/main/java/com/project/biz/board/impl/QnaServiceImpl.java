package com.project.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.biz.board.QnaService;
import com.project.biz.board.QnaVO;

@Service("QnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qDao;

	
	@Override
	public List<QnaVO> listQna(String userid) {
		return qDao.listQna(userid);
	}

	@Override
	public List<QnaVO> listAllQna() {
		return qDao.listAllQna();
	}

	@Override
	public QnaVO getQna(int qno) {
		return qDao.getQna(qno);
	}

	@Override
	public void insertQna(QnaVO qVo) {
		qDao.insertQna(qVo);
	}

	@Override
	public void updateQna(QnaVO qVo) {
		qDao.updateQna(qVo);
	}

}

package com.project.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.biz.board.QnaVO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<QnaVO> listQna(String userid) {
		return mybatis.selectList("QnaDAO.listQna", userid);
	}

	public List<QnaVO> listAllQna() {
		return mybatis.selectList("QnaDAO.listAllQna");
	}

	public QnaVO getQna(int qno) {
		return mybatis.selectOne("QnaDAO.getQna", qno);
	}

	public void insertQna(QnaVO qVo) {
		mybatis.insert("QnaDAO.insertQna", qVo);
	}

	public void updateQna(QnaVO qVo) {
		mybatis.update("QnaDAO.updateQna",qVo);
	}

}

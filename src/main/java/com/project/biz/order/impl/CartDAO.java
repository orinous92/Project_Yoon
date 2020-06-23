package com.project.biz.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.biz.order.CartVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartVO> cartList(String userid) {
		return mybatis.selectList("CartDAO.cartList", userid);
	}

	public void insertCart(CartVO cVo) {
		mybatis.insert("CartDAO.insertCart", cVo);
	}

	public void updateCart(int cno) {
		mybatis.update("CartDAO.updateCart", cno);
	}

	public void deleteCart(int cno) {
		mybatis.delete("CartDAO.deleteCart", cno);
	}

}

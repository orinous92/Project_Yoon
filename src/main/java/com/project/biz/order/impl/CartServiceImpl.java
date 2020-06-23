package com.project.biz.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.biz.order.CartService;
import com.project.biz.order.CartVO;

@Service("CartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cDao;
	
	@Override
	public void insertCart(CartVO cVo) {
		cDao.insertCart(cVo);
	}

	@Override
	public void updateCart(int cno) {
		cDao.updateCart(cno);
	}

	@Override
	public void deleteCart(int cno) {
		cDao.deleteCart(cno);
	}

	@Override
	public List<CartVO> cartList(String userid) {
		return cDao.cartList(userid);
	}

}

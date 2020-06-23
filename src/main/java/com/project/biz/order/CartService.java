package com.project.biz.order;

import java.util.List;

public interface CartService {
	
	// insert
	public void insertCart(CartVO cVo);
	
	// update
	public void updateCart(int cno);
	
	// delete
	public void deleteCart(int cno);
	
	// List
	List<CartVO> cartList(String userid);
	
}

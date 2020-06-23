package com.project.biz.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.biz.order.CartService;
import com.project.biz.order.CartVO;
import com.project.biz.order.OrderService;
import com.project.biz.order.OrderVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {
	
	
	
	  @Autowired 
	  private OrderDAO oDao;
	  
	  @Autowired 
	  private CartService cartService;
	 
	

	@Override
	public int selectMaxOno() {
		return oDao.selectMaxOno();
	}

	
	@Override
	public int insertOrder(OrderVO oVo) {
		
		int maxOno = selectMaxOno();
		
		oVo.setOno(maxOno);
		
		oDao.insertOrder(oVo);
		
		List<CartVO> cartList = cartService.cartList(oVo.getUserid());
		System.out.println(oVo.getUserid());
		
		for(CartVO cVo : cartList) {
			System.out.println("��ٱ��� ���� :" + cVo);
			
			OrderVO vo = new OrderVO();
			
			vo.setOno(maxOno);					
			vo.setPno(cVo.getPno());			
			vo.setQuantity(cVo.getQuantity());	
			
			insertOrderDetail(vo);
			
			cartService.updateCart(cVo.getCno());
		}
		
		return maxOno;
	}

	@Override
	public void insertOrderDetail(OrderVO oVo) {
		
		oDao.insertOrderDetail(oVo);
	}

	@Override
	public void updateOrderResult(OrderVO oVo) {
		
		oDao.updateOrderResult(oVo);
	}

	@Override
	public List<OrderVO> listOrderById(OrderVO oVo) {
		
		return oDao.listOrderById(oVo);
	}

	@Override
	public List<OrderVO> listOrder(OrderVO oVo) {

		return oDao.listOrder(oVo);
	}

	@Override
	public List<Integer> selectNoOrdering(String userid) {
		return oDao.selectNoOrdering(userid);
	}

}

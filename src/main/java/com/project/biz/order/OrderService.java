package com.project.biz.order;

import java.util.List;

import com.project.biz.order.OrderVO;

public interface OrderService {
	
	public int selectMaxOno();
	
	public int insertOrder(OrderVO oVo);
	
	public void insertOrderDetail(OrderVO oVo);
	
	public void updateOrderResult(OrderVO oVo);
	
	List<OrderVO> listOrderById(OrderVO oVo);
	
	List<OrderVO> listOrder(OrderVO oVo);
	
	List<Integer> selectNoOrdering(String userid);
	
}

package com.project.biz.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.biz.order.OrderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectMaxOno() {

		return mybatis.selectOne("OrderDAO.selectMaxOno");
	}

	
	public void insertOrder(OrderVO oVo) {
		mybatis.insert("OrderDAO.insertOrder", oVo);
		
	}

	public void insertOrderDetail(OrderVO oVo) {	
		mybatis.insert("OrderDAO.insertOrderDetail", oVo);
	}

	public void updateOrderResult(OrderVO oVo) {
		mybatis.update("OrderDAO.updateOrderResult", oVo);
	}

	public List<OrderVO> listOrderById(OrderVO oVo) {
		return mybatis.selectList("OrderDAO.listOrderById", oVo);
	}

	public List<OrderVO> listOrder(OrderVO oVo) {
		
		return mybatis.selectList("OrderDAO.listOrder", oVo);
	}


	public List<Integer> selectNoOrdering(String userid) {
		return mybatis.selectList("OrderDAO.selectNoOrdering", userid);
	}

	

}

package com.project.biz.product.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.biz.paging.Criteria;
import com.project.biz.product.CommentVO;
import com.project.biz.product.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 상품등록 
	public void register(ProductVO pVo) {
		mybatis.insert("ProductDAO.register", pVo);
	}
	
	/*/ 상품 목록
	public List<ProductViewVO> productList() throws Exception {
		return mybatis.selectList("ProductDAO.productList");
	}
	*/
	
	// 상품 상세조회
	public ProductVO getProduct(int pno) throws Exception{
		return mybatis.selectOne("ProductDAO.getProduct", pno);
	}
	
	
	// 상품 조회 
	public ProductVO productView(int pno) throws Exception{
		return mybatis.selectOne("ProductDAO.productView", pno);
	}
	
	// 상품 수정
	public void updateProduct(ProductVO pVo) {
		mybatis.update("ProductDAO.updateProduct", pVo);
	}
	
	// 상품 삭제
	public void deleteProduct(int pno) {
		mybatis.delete("ProductDAO.deleteProduct", pno);
	}

	public String fileInfo(int pno) {
		return mybatis.selectOne("ProductDAO.fileInfo", pno);
	}

	public List<ProductVO> getListWithPaging(Criteria cri, String pname) {
		
		System.out.println("==> mybatis getListWithPaging() 기능처리");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pname", pname);
		map.put("cri", cri);
		
		return mybatis.selectList("ProductDAO.getListWithPaging", map);
	}

	public List<ProductVO> getProductListByCateName(ProductVO pVo) {
		return mybatis.selectList("ProductDAO.getProductListByCateName", pVo);
	}

	public int productListCount(String pname) {
		return mybatis.selectOne("ProductDAO.productListCount", pname);
	}

	public List<CommentVO> getCommentList(int pno) {
		return mybatis.selectList("CommentDAO.getCommentList", pno);
	}

	public void insertComment(CommentVO cVo) {
		mybatis.insert("CommentDAO.insertComment", cVo);
	}

	public void updateComment(CommentVO cVo) {
		mybatis.update("CommentDAO.updateComment", cVo);
	}

	public void deleteComment(int comment_no) {
		mybatis.delete("CommentDAO.deleteComment", comment_no);
	}

	

}

package com.project.biz.product;

import java.util.List;

import com.project.biz.paging.Criteria;


public interface ProductService {
	
	/*
	 *  상품 기능
	 */
	
	// 상품 등록
	public void register(ProductVO pVo);
	
	// 상품 목록 조회 ( by 카테고리 ) 
	public List<ProductVO> getProductListByCateName(ProductVO pVo) throws Exception;
	
	// 상품 상세 조회
	public ProductVO getProduct(int pno) throws Exception;
	
	// 상품 조회
	public ProductVO productView(int pno) throws Exception;
	
	// 상품 업데이트
	public void updateProduct(ProductVO pVo);
	
	// 상품 삭제
	public void deleteProduct(int pno) throws Exception;
	
	// 상품 이미지 삭제를 위한 이미지 파일 정보
	public String fileInfo(int pno);
	
	// 페이징 처리 목록
	public List<ProductVO> getListWithPaging(Criteria cri, String pname);
	
	// 상품 목록 갯수
	public int productListCount(String pname) throws Exception;
	
	/*
	 * 	 상품 후기 기능
	 */
	
	List<CommentVO> getCommentList(int pno);
	void insertComment(CommentVO cVo);
	void updateComment(CommentVO cVo);
	void deleteComment(int comment_no);
	
	
}

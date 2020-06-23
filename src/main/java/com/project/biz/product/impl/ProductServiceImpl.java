package com.project.biz.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.biz.paging.Criteria;
import com.project.biz.product.CommentVO;
import com.project.biz.product.ProductService;
import com.project.biz.product.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO pDao;


	// 상품등록
	@Override
	public void register(ProductVO pVo) {
		pDao.register(pVo);
	}
	
	@Override
	public ProductVO getProduct(int pno) throws Exception {
		return pDao.getProduct(pno);
	}
	
	
	@Override
	public void updateProduct(ProductVO pVo){
		pDao.updateProduct(pVo);
	}

	@Override
	public void deleteProduct(int pno) throws Exception {
		pDao.deleteProduct(pno);
	}

	@Override
	public ProductVO productView(int pno) throws Exception {
		return pDao.productView(pno);
	}

	@Override
	public String fileInfo(int pno){
		return pDao.fileInfo(pno);
	}

	@Override
	public List<ProductVO> getListWithPaging(Criteria cri, String pname) {
		return pDao.getListWithPaging(cri, pname);
	}

	@Override
	public List<ProductVO> getProductListByCateName(ProductVO pVo) throws Exception {
		return pDao.getProductListByCateName(pVo);
	}

	@Override
	public int productListCount(String pname) throws Exception {
		return pDao.productListCount(pname);
	}
	
	// 상품 후기
	
	@Override
	public List<CommentVO> getCommentList(int pno) {
		return pDao.getCommentList(pno);
	}

	@Override
	public void insertComment(CommentVO cVo) {
		pDao.insertComment(cVo);
	}

	@Override
	public void updateComment(CommentVO cVo) {
		pDao.updateComment(cVo);
		
	}

	@Override
	public void deleteComment(int comment_no) {
		pDao.deleteComment(comment_no);
	}

	
}

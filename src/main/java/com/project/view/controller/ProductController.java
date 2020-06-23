package com.project.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.biz.member.MemberVO;
import com.project.biz.product.ProductService;
import com.project.biz.product.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product_view", method=RequestMethod.GET)
	public String productDetail(ProductVO pVo, Model model) throws Exception {
		
		ProductVO product = productService.getProduct(pVo.getPno());
		
		model.addAttribute("productVO" , product);
		
		return "product/productView";
	}
	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String productCateView(ProductVO pVo, Model model) throws Exception {
		
			List<ProductVO> listProductByCate = productService.getProductListByCateName(pVo);
			
			model.addAttribute("productCateList", listProductByCate);
			
			return "product/productCate";
		
			
	}
	
}

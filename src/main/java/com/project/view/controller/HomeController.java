package com.project.view.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.biz.paging.Criteria;
import com.project.biz.product.ProductService;
import com.project.biz.product.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProductService adminService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model, Criteria cri) {

		return "main";
	}
	
}

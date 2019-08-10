package com.yigou.controller;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yigou.entity.Category;
import com.yigou.entity.Goods;
import com.yigou.service.CategoryService;
import com.yigou.service.ProductService;


@Controller
public class ProductController {
	//@Autowired
	@Resource
	ProductService productService;
	
	@Resource
	CategoryService categoryService;	
	
	@RequestMapping("/showProduct")
	public String showProduct(Model model ,@RequestParam("good_id")Integer id){
		Goods product=productService.get(id);
		Category category=categoryService.get(product.getListid());
		model.addAttribute("category",category);
		model.addAttribute("product", product);
		List<Goods> hot=productService.hotlist(product.getListid(),0,2);
    	model.addAttribute("hot", hot);	
    	List<Category> categories=categoryService.list();
    	model.addAttribute("categories",categories);
		return "product";
	}	
	
    @RequestMapping("/searchResult")
    public String searchProduct(Model model ,String keyword){
    	List<Goods> goods=productService.search(keyword);
    	System.out.println(keyword);
    	model.addAttribute("goods",goods);
    	return "searchResult";
    } 
    
    @RequestMapping("/productCategory")
    public String ProductCategory(Model model,@RequestParam("category_id")Integer category_id){
    	Category category=categoryService.get(category_id);
    	model.addAttribute("category",category); 	
    	List<Category> categories=categoryService.list();
    	model.addAttribute("categories",categories);
    	List<Goods> hot=productService.hotlist(category_id,0,3);
    	model.addAttribute("hot", hot);	
    	
    	List<Goods> goods=productService.goodslist(category_id);
    	model.addAttribute("goods", goods);	    	
    	
    	return "productCategory";
    }
}

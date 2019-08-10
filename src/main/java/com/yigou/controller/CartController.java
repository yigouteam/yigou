package com.yigou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yigou.entity.Cart;
import com.yigou.entity.User;
import com.yigou.service.CartService;
import com.yigou.service.ProductService;
import com.yigou.service.UserService;

@Controller
public class CartController {
    @Resource 
    ProductService productService;
    @Resource
    CartService cartService;
    @Resource
    UserService userService;
    
    @RequestMapping("/addCart")
    public String addCart(Integer product_id, Integer number, HttpSession session) {
		  User user= (User)session.getAttribute("user");
		  if(null==user)
			  return "login";
		  List<Cart> carts=cartService.getByUserId(user.getId());
		  boolean flag = false;
		  for(Cart c:carts){
			  if(c.getGoodsid().intValue()==product_id){
				  c.setNumber(c.getNumber()+number);
				  c.setPrice(c.getNumber()*c.getProduct().getPrice());
				  cartService.update(c);
				  flag=true;
				  break;
			  }
		  }
		  if(!flag){
			  Cart cart=new Cart();
			  cart.setUserid(user.getId());
			  cart.setGoodsid(product_id);
			  cart.setNumber(number);
			  cart.setProduct(productService.get(product_id));
			  cart.setPrice(cart.getNumber()*cart.getProduct().getPrice());
			  cartService.add(cart);
			  
		  }
    	 return "redirect:showProduct?good_id="+product_id;
    
    }
    
	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		 if(null==user)
			  return "login";
		 List<Cart> carts= cartService.getByUserId(user.getId());
		 model.addAttribute("carts", carts);
	
		return "cart";
	}
	
	@RequestMapping("changeOrderItem")
	@ResponseBody
	public String changeOrderItem(Model model, HttpSession session, @RequestParam("pid")int pid, @RequestParam("number")int number) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";
		System.out.println("233333");
		List<Cart> ois = cartService.getByUserId(user.getId());
		for (Cart oi : ois) {
			if (oi.getGoodsid().intValue() == pid) {
				System.out.println("233333");
				oi.setNumber(number);
				oi.setPrice(oi.getNumber()*oi.getProduct().getPrice());
				cartService.update(oi);
				break;
			}
		}
		return "success";
	}

	@RequestMapping("deleteOrderItem")
	@ResponseBody
	public String deleteOrderItem(Model model, HttpSession session, Integer oiid) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";
		cartService.delete(oiid);
		return "success";
	}
	
	
}

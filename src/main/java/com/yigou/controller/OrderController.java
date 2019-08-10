///package com.yigou.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yigou.entity.Address;
import com.yigou.entity.Cart;
import com.yigou.entity.Goods;
import com.yigou.entity.Orderitem;
import com.yigou.entity.Orders;
import com.yigou.entity.User;
import com.yigou.service.AddressService;
import com.yigou.service.CartService;
import com.yigou.service.OrderItemService;
import com.yigou.service.OrderService;
import com.yigou.service.ProductService;

@Controller
public class OrderController {
  //  private Integer Address_id=0;
	@Resource
     ProductService productService;
	 @Resource
     CartService cartService;
     @Resource
     OrderService orderService;
     @Resource
     OrderItemService orderItemService;
     @Resource
     AddressService addressService;
     
     
     
     @RequestMapping("/buynow")
 	public String buynow(Integer product_id, Integer number, HttpSession session) {
 		
 		int oiid = 0;
 		User user = (User) session.getAttribute("user");
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
				  oiid = c.getId();
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
			  oiid = cart.getId();
		  }
		  return "redirect:buy?oiid="+oiid;
 	}
     
     @RequestMapping("/buy")
     public String buy(Model model ,String [] oiid ,HttpSession session){
    	 User user=(User)session.getAttribute("user");
    	 if(user==null)
    		 return "login";
    	 List<Address> address=addressService.listByUser(user.getId());
    	 model.addAttribute("address", address);
    	 List<Cart> carts = new ArrayList<Cart>();
    	 
         float total = 0;
         for (String str : oiid) {
             int id = Integer.parseInt(str);
             Cart cart= cartService.get(id);
             total +=cart.getProduct().getPrice()*cart.getNumber();
             carts.add(cart);
         }
         session.setAttribute("carts", carts);
         model.addAttribute("total", total);
         return "buy";
     }
     @RequestMapping("/changeAddress")
     @ResponseBody
     public String changeAddress(Model model ,Integer address_id,HttpSession session){
    	 User user=(User)session.getAttribute("user");
    	 if(user==null)
    		 return "login";
    //	 Address_id=address_id;
    	 System.out.println(address_id);
    	 return "success";
    	 
     }
     @RequestMapping("/addAddress")
     @ResponseBody
     public String addAddress(Address address,String province,String city,String area,String detailaddress,String receiver,String mobile,HttpSession session){
    	 User user=(User)session.getAttribute("user");
    	 if(user==null)
    		 return "login";
    	 address.setProvince(province);
    	 address.setCity(city);
    	 address.setArea(area);
    	 address.setDetailaddress(detailaddress);
    	 address.setReceiver(receiver);
    	 address.setMobile(mobile);
    	 address.setUserid(user.getId());
    	 addressService.add(address);
    	 
    //	 System.out.println(area);
		 return "success";
    	 
    	 
     }
  
	@RequestMapping("/createOrder")
     public String creatOrder(Model model ,Integer address_id,HttpSession session){
    	 User user=(User)session.getAttribute("user");
    	 if(user==null)
    		 return "login";
    	 String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
         Orders order=new Orders();
    	 order.setOrderCode(orderCode);
    	 order.setOrdertime(new Date());
    	 order.setStatus("1");
    	 order.setUserid(user.getId());
    	 order.setAdd_id(address_id);
         System.out.println(address_id);
    	 
		 List<Cart> carts= (List<Cart>)session.getAttribute("carts");
		 List<Orderitem> ois=new ArrayList<Orderitem>();
    	 for(Cart cartitem:carts){
    		 Orderitem orderitem=new Orderitem();
    		 orderitem.setGoodsid(cartitem.getGoodsid());
    		 orderitem.setNumber(cartitem.getNumber());
    		 orderitem.setTotalprice(cartitem.getPrice());
    		 ois.add(orderitem);
    		 Goods good=productService.get(orderitem.getGoodsid());
    		 good.setStock(good.getStock()-orderitem.getNumber());
    	     productService.update(good);	 
    		 cartService.delete(cartitem.getId());
	 
    	 }   
         float total =orderService.add(order,ois);
         return "redirect:pay?order_id="+order.getId() +"&total="+total;
     }
	
	@RequestMapping("pay")
	public String pay(Model model, Integer order_id,float total) {
		Orders order = orderService.getOrder(order_id);
		orderItemService.fill(order);
		model.addAttribute("order", order);
		Address address=addressService.get(order.getAdd_id());
		model.addAttribute("address", address);
		return "pay";
	}
	
	@RequestMapping("payed")
	public String payed(int order_id, float total, Model model) {
	   	
		Orders order = orderService.getOrder(order_id);

		order.setStatus("2");
		orderService.update(order);
		Address address=addressService.get(order.getAdd_id());
		model.addAttribute("order", order);
		model.addAttribute("address",address);
		return "payed";
	}

	@RequestMapping("myOrder")
	public String bought(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user==null)
			return "login";
		List<Orders> orders = orderService.list(user.getId(), "6");
		orderItemService.fill(orders);
		model.addAttribute("orders", orders);

		return "myOrder";
	} 
	
	@RequestMapping("update_delivery_status")
	@ResponseBody
	public String update_delivery_status(Integer order_id,HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user==null)
			return "login";
		Orders order=orderService.getOrder(order_id);
		order.setStatus("3");
		orderService.update(order);
		return "success";
	}
	
	@RequestMapping("update_receipt_status")
	@ResponseBody
	public String update_receipt_status(Integer order_id,HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user==null)
			return "login";
		Orders order=orderService.getOrder(order_id);
		order.setStatus("4");
		orderService.update(order);
		List<Orderitem> ois=orderItemService.getByOrderId(order_id);
		for(Orderitem orderitem:ois){
			Goods good=productService.get(orderitem.getGoodsid());
			good.setSales(good.getSales()+orderitem.getNumber());
			productService.update(good);		
		}
		return "success";
	}
	
	@RequestMapping("update_review_status")
	@ResponseBody
	public String update_review_status(Integer order_id,HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user==null)
			return "login";
		Orders order=orderService.getOrder(order_id);
		order.setStatus("5");
		orderService.update(order);
		return "success";
	}
	

	
	@RequestMapping("deleteOrder")
	@ResponseBody
	public String deleteOrder(Model model, Integer order_id) {
		Orders order = orderService.getOrder(order_id);
		order.setStatus("6");
		orderService.update(order);
		return "success";
	}
	
	@RequestMapping("cancelOrder")
	@ResponseBody
	public String cancelOrder(Integer order_id){
		Orders order = orderService.getOrder(order_id);
		order.setStatus("0");
		orderService.update(order);
		
		List<Orderitem> ois=orderItemService.getByOrderId(order_id);
		for(Orderitem orderitem:ois){
			Goods good=productService.get(orderitem.getGoodsid());
			good.setStock(good.getStock()+orderitem.getNumber());
			productService.update(good);		
		}
		return "success";
		
	}
}

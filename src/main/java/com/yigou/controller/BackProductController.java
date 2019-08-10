package com.yigou.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yigou.entity.*;
import com.yigou.utils.*;
import com.yigou.service.*;


@Controller
@RequestMapping("/admin")
public class BackProductController {
	@Resource
	ProductService productService;	
	@Resource
	UserService userService;	
	@Resource
	CategoryService categoryService;
	@Resource
	ProductImageService goodsimgService;
	@Resource
	OrderService orderService;
	@Resource
	AddressService addressService;
	@Resource
	OrderItemService orderItemService;
	@Resource
	AdminService adminService;
	
	@RequestMapping("/welcome")
   public String adminloginPage(){	
		return "admin/welcome";
	}
	
	@RequestMapping("/adminLoginCheck")
	   public String adminloginckeck(HttpServletRequest request,HttpSession session){	
		String name=request.getParameter("name");
		String pw=request.getParameter("password");
		Admin admin=adminService.get(name, pw);
		if (null == admin) {
			return "admin/welcome";
		}
		else{
			session.setAttribute("admin", admin);
			return "redirect:backindex" ;
		}
			
		}
	@RequestMapping("/adminLogout")
	public String adminlogout(HttpSession session) {
		session.removeAttribute("admin");
		return "redirect:welcome";
	}
	@RequestMapping("/backindex")
	public String index(HttpSession session){
		Admin ad=(Admin)session.getAttribute("admin");
		if(ad==null)
			return "admin/welcome";
		
		return "admin/backindex";

		
	}
	
	@RequestMapping("/main")
	public ModelAndView main(){		
		ModelAndView mav = new ModelAndView();
		int total_user = userService.total();
		int total_goodsimg = goodsimgService.total();
		int total_product = productService.total();
		int total_order = orderService.total();
		
		mav.addObject("total_user", total_user);
		mav.addObject("total_goodsimg", total_goodsimg);
		mav.addObject("total_product", total_product);
		mav.addObject("total_order", total_order);
		
		List<Goods> saleslist = productService.bySales(0, 15);
		mav.addObject("saleslist", saleslist);
		
		
		mav.setViewName("/admin/main");
		return mav;
	}
	
	@RequestMapping("/addUser")
	public String addUser(Model model){
		return "admin/addUser";
	}
	
	@RequestMapping("/changePwd")
	public String changePwd(Model model){
		return "admin/changePwd";
	}
	
	@RequestMapping("/linksAdd")
	public String linksAdd(Model model){
		return "admin/linksAdd";
	}
	
	@RequestMapping("/linksList")
	public String linksList(Model model){
		List<Orders> orders=orderService.listAll();
		
		for(Orders order:orders){
			Address address=addressService.get(order.getAdd_id());
			order.setAddress(address);
		}
		model.addAttribute("orders", orders);
		return "admin/linksList";
	}
	@RequestMapping("/order_items")
	public String order_items(Model model,Integer order_id){
		List<Orderitem> ois=orderItemService.getByOrderId(order_id);
		for(Orderitem oi:ois){
			Goods good=productService.get(oi.getGoodsid());
			oi.setGoods(good);
		}
		model.addAttribute("ois", ois);		
		return "admin/order_items";
	
	}
	
	
	@RequestMapping("/userInfo")
	public String userInfo(Model model){
		return "admin/userInfo";
	}
	@RequestMapping("/addProduct")
	public String addProduct(){
		return "admin/addProduct";
	}
	
	@RequestMapping("/add_Product")
	public String addproduct(String goodsname, Integer categoryname, String format, Integer stock, String price, String introduction, HttpServletRequest request, HttpServletResponse response){//	
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(goodsname);
		
		Goods good = new Goods();	
		float price2 = Float.parseFloat(price);
		good.setGoodsname(goodsname);
		good.setListid(categoryname);
		good.setFormat(format);
		good.setPrice(price2);
		good.setStock(stock);
		good.setSales(0);
		good.setIntroduction(introduction);
		productService.add(good);
		
		Goodsimg productImage = new Goodsimg();
		productImage.setGoodsid(good.getId());
		for (int i = 1; i <= 4; i++) {
			goodsimgService.add(productImage);
		}
		
		return "success";
	}
	
	@RequestMapping("/editProduct")
	public String editProduct(Model model,Integer good_id) {
	  Goods good=productService.get(good_id);
	   model.addAttribute("good", good);
		return "admin/editProduct";
	}
	
	@RequestMapping("/edit_product")
	@ResponseBody
	public String editProduct(Integer id, String name, String listid, String format, 
			String stock, String price, String introduction){

		Goods good =productService.get(id);		
		int stock2 = Integer.parseInt(stock);
		float price2 = Float.parseFloat(price);
		int listid2 = Integer.parseInt(listid) + 1;	
		
		good.setGoodsname(name);
		good.setListid(listid2);
		good.setFormat(format);
		good.setPrice(price2);
		good.setStock(stock2);
		good.setIntroduction(introduction);		
		productService.update(good);
		return "success";
	}
	private static boolean deleteDir(File dir) {
		if (dir.isDirectory()) {
			String[] children = dir.list();
			//递归删除目录中的子目录下
			for (int i = 0; i < children.length; i++) {
				boolean success = deleteDir(new File(dir, children[i]));
				if (!success) {
					return false;
				}
			}
		}
		// 目录此时为空，可以删除
		return dir.delete();
	}

	@RequestMapping("/deleteproduct")
	public String deleteProduct(HttpServletRequest request, Integer goodsid){
		  goodsimgService.deleteByProductId(goodsid);
		  String path = request.getSession().getServletContext().getRealPath("images/products/" + goodsid);
		  deleteDir(new File(path));
		  productService.delete(goodsid);
		return "success";
	}
	
	@RequestMapping("/allUsers")
	public ModelAndView allUsers(Model model){
		List<User> list = userService.list();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/admin/allUsers");
		return mav;
	}
	
	@RequestMapping("/categorylist")
	public ModelAndView categorylist(Page page){
		ModelAndView mav = new ModelAndView();
		List<Goods> list = productService.list(page);
		int total = productService.total();
		
		page.caculateLast(total);
		
		mav.addObject("list", list);
		mav.setViewName("/admin/categorylist");
		return mav;
	}
		
	@RequestMapping("/productImg")
	public ModelAndView productImg(Integer good_id){
		ModelAndView mav = new ModelAndView();
		List<Goodsimg> imgs = goodsimgService.list(good_id);
		mav.addObject("imglist", imgs);
		mav.setViewName("/admin/productImg");
		
		return mav;
	}
	@RequestMapping(value = "/updateProductImage", method = RequestMethod.POST)
	@ResponseBody
	public String update(HttpServletRequest request,Integer img_id,Integer product_id, 
					@RequestParam("file")  MultipartFile file) {
		// 上传文件到指定位置
			String filePath = request.getSession().getServletContext().getRealPath("images/products/" + product_id);
				// 因为 id 是自增长键，所以需要 % 4 来作为文件名
				String fileName = (img_id % 4 == 0 ? 4 : img_id % 4) + ".jpg";
				File uploadPicture = new File(filePath, fileName);
				if (!uploadPicture.exists()) {
					uploadPicture.mkdirs();
				}
				// 保存
				try {
					file.transferTo(uploadPicture);
				} catch (Exception e) {
					e.printStackTrace();
				}	
			System.out.println("success");
		    Map<String,Object> map = new HashMap<String,Object>();
		    map.put("code",0);//0表示成功，1失败
		    ObjectMapper mapper = new ObjectMapper();
	        String resultString = "";
	        try {
				resultString = mapper.writeValueAsString(map);
			} catch (IOException e) {
				e.printStackTrace();
			}
	        return resultString;
	}
	
	

	
	@RequestMapping("/deleteimg")
	public String deleteimg(HttpServletRequest request,Integer imgid){
		
	 Goodsimg img=goodsimgService.get(imgid);
	 String filePath = request.getSession().getServletContext().getRealPath("images/products/" + img.getGoodsid());
	    String fileName = (imgid % 4 == 0 ? 4 : imgid % 4) + ".jpg";		
		new File(filePath, fileName).delete();
		return "sucess";
}
}

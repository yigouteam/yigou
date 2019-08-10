package com.yigou.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yigou.entity.Category;
import com.yigou.entity.User;
import com.yigou.service.CategoryService;
import com.yigou.service.ProductService;
import com.yigou.service.UserService;
import com.yigou.utils.ImageUtil;
import com.yigou.utils.MD5Utils;
import com.yigou.utils.MailUitls;
import com.yigou.utils.UUIDUtils;

@Controller
public class PageController {
	@Resource
	ProductService productService;
	@Resource
	CategoryService categoryService;
	@Resource
	UserService userService;
	
	public String verify;
	
	public String uuidcode;
	

	
	
	
	@RequestMapping("/index")
	public String home( Model model) {
		List<Category> categories=categoryService.list();
		productService.fill(categories);
		model.addAttribute("categories", categories);	
		return "index";
	}
	
	@RequestMapping("/createImg2")
	public void createImg(HttpSession session,	HttpServletResponse response){
		try {//localhost:8007/verifyDemo/createImg.do
			Map<String,BufferedImage> map=ImageUtil.createImage();
			String code=map.keySet().iterator().next();
			session.setAttribute("code",code);
			//调用工具类产生BufferedImage图片
			//用ImageIO.write()将图片写出到网页中
			OutputStream os=response.getOutputStream();
			BufferedImage img=map.get(code);
			verify = code;
			System.out.println(code);
			response.setContentType("image/jpeg");
			ImageIO.write(img, "jpeg", os);
			os.flush();  //os.flush()强制清空输出流中的内容
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/logincheck")
	public String logincheck(Model model,String email,String password,String verifycode,HttpSession session){
		
		String mpwd = MD5Utils.calc(password);
		
		User user = userService.get(email, mpwd);
		
		System.out.println(email);
		System.out.println(mpwd);
		System.out.println(verifycode);
		if (null == user) {
			model.addAttribute("msg", "账号密码错误");
			return "redirect:login";
		}
		
		if (!verifycode.equals(verify)){
			model.addAttribute("msg", "验证码错误");
			return "redirect:login";
		}

		session.setAttribute("user", user);

		
		return "redirect:index";	
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:index";
	}
	
	
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	
	@RequestMapping("/registerCheck")
	public String register(Model model, String EmailOrPhone,String username,String password) {
		User user=new User();
		
		String mpwd = MD5Utils.calc(password);
		user.setEmail(EmailOrPhone);
		user.setUsername(username);
		user.setPasswd(mpwd);
		userService.add(user);
		

		String code = UUIDUtils.getUUID();
		
		uuidcode = code;
		
		System.out.println(code);
		
		try {
			 MailUitls .sendEmail(EmailOrPhone, code);
			System.out.println("邮件已发送！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("邮件发送失败！");
		}
		
        
		return "redirect:registerSuccess";
	}
	
	@RequestMapping("/registerSuccess")
	public String registerSuccess() {
		
		return "registerSuccess";
	}
	

	                  
	@RequestMapping("/activesuccess")
	public String activesuccess(String activecode) {
		ModelAndView mav = new ModelAndView();
		
		if(activecode.equals(uuidcode)){
			return "activesuccess";
		}
		else{
			return "registerSuccess";
		}
		
	}
}

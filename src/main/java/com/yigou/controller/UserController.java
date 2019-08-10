package com.yigou.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yigou.entity.Address;
import com.yigou.entity.User;
import com.yigou.service.AddressService;
import com.yigou.service.UserService;
import com.yigou.utils.ImageUtil;
import com.yigou.utils.MD5Utils;
import com.yigou.utils.UUIDUtils;

@Controller
public class UserController {
	@Resource
	UserService userService;
	@Resource
	AddressService addressService;
	
	public String verify;
	
	@RequestMapping("/user_center")
	public String user_center(HttpSession session){
		 User user=(User)session.getAttribute("user");
    	 if(user==null)
    		 return "login";	
		return "user_center";	
	}
	
	@RequestMapping("/user_address")
	public String address(HttpSession session,Model model){
	User user=(User)session.getAttribute("user");
   	 if(user==null)
   		 return "login";
   	 List<Address> address=addressService.listByUser(user.getId());
   	 model.addAttribute("address", address);
		return "user_address";
	}
	
	@RequestMapping("/password")
	public String editPassword(HttpSession session){
		User user=(User)session.getAttribute("user");
	   	 if(user==null)
	   		 return "login";
		return "user_password";
	   	 
	}
	
	@RequestMapping("/passwordCheck")
    @ResponseBody
    public String passwordCheck(HttpSession session, @RequestParam("old_pw")String password) throws JsonProcessingException {
		User user=(User)session.getAttribute("user");
		if(user==null)
	   		 return "login";
		
		boolean result=false;
		if(user.getPasswd().equals(MD5Utils.calc(password)))
			result =true;
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("valid", result);
        ObjectMapper mapper = new ObjectMapper();
        String resultString = "";
        try {
			resultString = mapper.writeValueAsString(map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return resultString;
    	
    }
	
	
	@RequestMapping("/createImg")
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
	
	@RequestMapping(value = "/registvalidate", method = RequestMethod.POST)
	@ResponseBody
	public String registvalidate(String email){
		
		boolean bool = userService.isExistemail(email);

		if(!bool){
			return "exist";
		}
		return "notExist";	
	}
	
	@RequestMapping(value = "/verifyCode", method = RequestMethod.POST)
	@ResponseBody
	public String verifycodeValidate(String verifycode) {
		if(verify.equals(verifycode)){
			return "success";
		}	
		else
			return "error";
	}
    
    @RequestMapping("/update_pw")
    @ResponseBody
    public String update_pw(HttpSession session,String pw){
    	User user=(User)session.getAttribute("user");
    	
    	String mpwd = MD5Utils.calc(pw);
    	user.setPasswd(mpwd);
    	userService.update(user);
    	return "success";
    }
    
    @RequestMapping("/deleteAddress")
    @ResponseBody
    public String deleteAddress(Integer address_id){
    	addressService.delete(address_id);
    	return "success";
    }
    
    @RequestMapping("/editAddress")
    @ResponseBody
    public String editAddress(Integer id,String province,String city,String area,String detailaddress,String receiver,String mobile){
    	Address address=addressService.get(id);
    	address.setProvince(province);
   	    address.setCity(city);
   	    address.setArea(area);
   	    address.setDetailaddress(detailaddress);
   	    address.setReceiver(receiver);
   	    address.setMobile(mobile);
   	    addressService.update(address);
    	return "success";
    }

}

package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yigou.entity.Cart;
import com.yigou.entity.CartExample;
import com.yigou.entity.Goods;
import com.yigou.entity.Orders;
import com.yigou.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
     @Resource
     CartMapper cartMapper;
     @Resource
     ProductService productService;
    
 	public void addProduct(Cart cart) {
		Goods product = productService.get(cart.getGoodsid());
		cart.setProduct(product);
	}
	
	public void addProduct(List<Cart> carts){
		for(Cart c:carts){
			addProduct(c);
		}
	}
	
     
     public Cart get(Integer id) {
 		Cart cart=cartMapper.selectByPrimaryKey(id);
 		addProduct(cart);
 		return cart;
 	}
     
	public void add(Cart cart) {
		
		cartMapper.insert(cart);
	}

	public List<Cart> getByUserId(Integer user_id) {
		CartExample example =new CartExample();
		example.or().andUseridEqualTo(user_id);
		List<Cart> carts=cartMapper.selectByExample(example);
		addProduct(carts);
		return carts;
	}

	
	public void update(Cart cart) {
		
		cartMapper.updateByPrimaryKey(cart);
	}

	public void delete(Integer id) {
		cartMapper.deleteByPrimaryKey(id);
		
	}

	public void fill(Orders order) {
		// TODO Auto-generated method stub
		
	}

	

}

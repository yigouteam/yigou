package com.yigou.service;

import java.util.List;

import com.yigou.entity.Cart;
import com.yigou.entity.Orders;

public interface CartService {
    Cart get(Integer id);     
	
	void add(Cart cart);
	
	List<Cart> getByUserId(Integer user_id);
	
	void update(Cart cart);
	
	void delete(Integer id);
	
	void fill(Orders order);


}


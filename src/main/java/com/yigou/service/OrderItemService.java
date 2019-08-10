package com.yigou.service;

import java.util.List;

import com.yigou.entity.Orderitem;
import com.yigou.entity.Orders;

public interface OrderItemService {
	void add(Orderitem orderItem);
	
	Orderitem getById(Integer id);
	
	List<Orderitem> getByOrderId(Integer order_id);
	
	void update(Orderitem orderItem);
	
	List<Orderitem> listByUserId(Integer user_id);
	
	void fill(List<Orders> orders);
	
	void fill(Orders order);

}

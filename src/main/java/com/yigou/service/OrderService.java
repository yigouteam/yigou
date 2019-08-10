package com.yigou.service;

import java.util.List;

import com.yigou.entity.Orderitem;
import com.yigou.entity.Orders;

public interface OrderService {
    
	Orders getOrder(Integer id);
	
	List<Orders> listAll();
	
	List<Orders> listByUserId(Integer user_id);
	
	List<Orders> list(Integer user_id, String excludedStatus);
    
	void update(Orders order);
	
	void add(Orders order);
	
	float add(Orders order, List<Orderitem> ois);

	int total();


	
	

}

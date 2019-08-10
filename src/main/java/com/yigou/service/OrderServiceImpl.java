package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yigou.entity.Orderitem;
import com.yigou.entity.Orders;
import com.yigou.entity.OrdersExample;
import com.yigou.mapper.OrdersMapper;

@Service
public class OrderServiceImpl implements OrderService {
   @Resource
   OrdersMapper ordersMapper;
   @Resource 
   OrderItemService orderItemService;

public Orders getOrder(Integer id) {
	return ordersMapper.selectByPrimaryKey(id) ;
}

public List<Orders> listAll() {
	return ordersMapper.selectByExample(new OrdersExample());
}

public List<Orders> listByUserId(Integer user_id) {
	OrdersExample example =new OrdersExample();
	example.or().andUseridEqualTo(user_id);
	return ordersMapper.selectByExample(example);
}

public List<Orders> list(Integer user_id, String excludedStatus) {
	OrdersExample example = new OrdersExample();
	example.or().andUseridEqualTo(user_id).andStatusNotEqualTo(excludedStatus);
	example.setOrderByClause("id desc");
	return ordersMapper.selectByExample(example);
}

public void update(Orders order) {
	ordersMapper.updateByPrimaryKey(order);
}

public void add(Orders order) {
	ordersMapper.insert(order);
}

public float add(Orders order, List<Orderitem> ois) {
	float total = 0;
	add(order);
	for (Orderitem oi : ois) {
		oi.setOrderid(order.getId());
		orderItemService.add(oi);
		total += oi.getTotalprice() * oi.getNumber();
	}
	order.setTotal(total);
	update(order);
	return total;
	
}

public int total(){
	
	return ordersMapper.total();
}
}

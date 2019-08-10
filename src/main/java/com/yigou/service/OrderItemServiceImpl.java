package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yigou.entity.Goods;
import com.yigou.entity.Orderitem;
import com.yigou.entity.OrderitemExample;
import com.yigou.entity.Orders;
import com.yigou.mapper.OrderitemMapper;

@Service
public class OrderItemServiceImpl implements OrderItemService{
    @Resource
	OrderitemMapper orderitemMapper;
    
    @Resource
    ProductService productService;
    
    public void add(Orderitem orderItem) {
		orderitemMapper.insert(orderItem);
	}
    
	public Orderitem getById(Integer id) {
		return orderitemMapper.selectByPrimaryKey(id);
	}

	public List<Orderitem> getByOrderId(Integer order_id) {
		OrderitemExample example=new OrderitemExample();
		example.or().andOrderidEqualTo(order_id);
		return orderitemMapper.selectByExample(example);
	}

	public void update(Orderitem orderItem) {
		orderitemMapper.updateByPrimaryKey(orderItem);
	}

	public List<Orderitem> listByUserId(Integer user_id) {
		OrderitemExample example=new OrderitemExample();
		example.or().andUseridEqualTo(user_id);
		List<Orderitem> orderitem=orderitemMapper.selectByExample(example);
		
		return orderitem;
	}
	public void fillGoods(List<Orderitem> ois) {
		for (Orderitem oi : ois) {
			fillGoods(oi);
		}
	}

	public void fillGoods(Orderitem oi) {
		Goods goods = productService.get(oi.getGoodsid());
		oi.setGoods(goods);
	}
	
	public void fill(List<Orders> orders) {
		for (Orders order : orders) {
			fill(order);
		}
	}

	public void fill(Orders order) {
		OrderitemExample example = new OrderitemExample();
		example.or().andOrderidEqualTo(order.getId());
		example.setOrderByClause("id desc");
		List<Orderitem> orderItems = orderitemMapper.selectByExample(example);
		fillGoods(orderItems);
		
		float total = 0;
		int totalNumber = 0;
		for (Orderitem oi : orderItems) {
			total += oi.getNumber() * oi.getGoods().getPrice();
			totalNumber += oi.getNumber();
		}
		order.setTotal(total);
		order.setTotalNumber(totalNumber);
		order.setOrderItems(orderItems);
	}

}

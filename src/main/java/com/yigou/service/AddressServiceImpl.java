package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yigou.entity.Address;
import com.yigou.entity.AddressExample;
import com.yigou.mapper.AddressMapper;
@Service
public class AddressServiceImpl implements AddressService {
   @Resource
   AddressMapper addressMapper;
   
	public Address get(Integer id) {
		return addressMapper.selectByPrimaryKey(id);
	}

	public void add(Address address) {
		addressMapper.insert(address);
		
	}

	public List<Address> listByUser(Integer user_id) {
		AddressExample example=new AddressExample();
		example.or().andUseridEqualTo(user_id);
		example.setOrderByClause("id asc");
		return addressMapper.selectByExample(example);
	}

	public void delete(Integer id) {
		addressMapper.deleteByPrimaryKey(id);
		
	}

	public void update(Address address) {
	    addressMapper.updateByPrimaryKey(address);
		
	}

}

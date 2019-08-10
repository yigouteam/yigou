package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yigou.entity.Admin;
import com.yigou.entity.AdminExample;

import com.yigou.mapper.AdminMapper;


@Service
public class AdminServiceImpl implements AdminService{
	@Resource
	AdminMapper adminMapper;

	
	

	public Admin get(String name, String password) {
		AdminExample example = new AdminExample();
		example.or().andNameEqualTo(name).andPasswdEqualTo(password);
		List<Admin> result = adminMapper.selectByExample(example);
		if (result.isEmpty())
			return null;
		return result.get(0);
	}

	
}

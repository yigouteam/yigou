package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yigou.entity.User;
import com.yigou.entity.UserExample;
import com.yigou.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	UserMapper userMapper;

	
	public List<User> list() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	public void update(User user) {
		userMapper.updateByPrimaryKey(user);
	}

	public User get(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public User get(String Email, String password) {
		UserExample example = new UserExample();
		example.or().andEmailEqualTo(Email).andPasswdEqualTo(password);
		List<User> result = userMapper.selectByExample(example);
		if (result.isEmpty())
			return null;
		return result.get(0);
	}

	public boolean isExist(String name) {
		UserExample example =new UserExample();
		example.or().andUsernameEqualTo(name);
		List<User> result= userMapper.selectByExample(example);
		if(!result.isEmpty())
			return true;
		return false;
	}

	public void add(User user) {
		userMapper.insert(user);
	}

	public boolean isExistemail(String email) {
		UserExample example = new UserExample();
		example.or().andEmailEqualTo(email);
		List<User> user = userMapper.selectByExample(example);
		if(user.isEmpty())
			return true;
		return false;
	}
	
	public int total() {
		return userMapper.total();
	}

}

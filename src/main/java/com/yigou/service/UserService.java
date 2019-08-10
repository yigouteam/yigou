package com.yigou.service;

import java.util.List;

import com.yigou.entity.User;

public interface UserService {

	List<User> list();

	void update(User user);

	User get(Integer id);

	User get(String name, String password);

	boolean isExist(String name);

	void add(User user);
	
	boolean isExistemail(String email);

	int total();

}

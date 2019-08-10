package com.yigou.service;

import java.util.List;

import com.yigou.entity.Category;

public interface CategoryService {
	List<Category> list();

	Category get(Integer id);
}

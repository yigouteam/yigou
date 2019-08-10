package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.yigou.entity.Category;
import com.yigou.entity.CategoryExample;
import com.yigou.mapper.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService{
 @Resource
 CategoryMapper categoryMapper;
	
	public List<Category> list() {
		return categoryMapper.selectByExample(new CategoryExample());
	}

	public Category get(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

}

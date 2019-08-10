package com.yigou.service;

import java.util.List;

import com.yigou.entity.Category;
import com.yigou.entity.Goods;
import com.yigou.utils.Page;

public interface ProductService {
	Goods get(Integer id);
	List<Goods> search(String keyword);
	List<Goods> goodslist(Integer category_id);
	
	//首页数目
	List<Goods> indexlist(Integer category_id);
	
	void fill(Category category);
	
	void fill(List<Category> categories);
	
	void add(Goods good);
	
	void update(Goods good);
	
	void delete(Integer id);
	
	List<Goods> hotlist(Integer category_id,int offset,int limit);
	
	int total();
	
	List<Goods> bySales(int offset,int limit);
	
	List<Goods> list(Page page);
}

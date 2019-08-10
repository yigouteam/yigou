package com.yigou.service;


import java.util.List;

import com.yigou.entity.Goodsimg;

public interface ProductImageService {

	void add(Goodsimg image);

	void deleteByProductId(Integer product_id);

	void update(Goodsimg image);

	Goodsimg get(Integer id);

	List<Goodsimg> list(Integer product_id);

	int total();
}

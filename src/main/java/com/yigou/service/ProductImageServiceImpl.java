package com.yigou.service;


import org.springframework.stereotype.Service;

import com.yigou.entity.Goodsimg;
import com.yigou.entity.GoodsimgExample;
import com.yigou.mapper.GoodsimgMapper;

import java.util.List;

import javax.annotation.Resource;


@Service
public class ProductImageServiceImpl implements ProductImageService {

	@Resource
	GoodsimgMapper goodsimgMapper;

	public void add(Goodsimg image) {
		goodsimgMapper.insert(image);
	}

	public void deleteByProductId(Integer product_id) {

		// 按条件查询出需要删除的列表
		GoodsimgExample example = new GoodsimgExample();
		example.or().andGoodsidEqualTo(product_id);
		List<Goodsimg> goodsimgs = list(product_id);

		// 循环删除
		for (int i = 0; i < goodsimgs.size(); i++) {
			goodsimgMapper.deleteByPrimaryKey(goodsimgs.get(i).getId());
		}
	}

	public void update(Goodsimg image) {
		goodsimgMapper.updateByPrimaryKey(image);
	}

	public Goodsimg get(Integer id) {
		return goodsimgMapper.selectByPrimaryKey(id);
	}

	public List<Goodsimg> list(Integer product_id) {
		GoodsimgExample example = new GoodsimgExample();
		example.or().andGoodsidEqualTo(product_id);
		List<Goodsimg> goodsimg = goodsimgMapper.selectByExample(example);
		return goodsimg;
	}
	
	public int total() {
		return goodsimgMapper.total();
	}  
}

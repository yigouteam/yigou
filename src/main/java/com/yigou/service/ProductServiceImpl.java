package com.yigou.service;

import java.util.List;

import javax.annotation.Resource;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yigou.entity.Category;
import com.yigou.entity.Goods;
import com.yigou.entity.GoodsExample;
import com.yigou.mapper.GoodsMapper;
import com.yigou.utils.Page;

@Service("productService")
public class ProductServiceImpl implements ProductService {
   @Resource
   GoodsMapper goodsMapper;

   
   public Goods get(Integer id) {
		return goodsMapper.selectByPrimaryKey(id);	 
   }
   
   public List<Goods> search(String keyword) {
		GoodsExample example=new GoodsExample();
		example.or().andGoodsnameLike("%"+keyword+"%");
		List<Goods> goods=goodsMapper.selectByExample(example);
		return goods;
   }
   
  
	public List<Goods> goodslist(Integer category_id) {
		GoodsExample example=new GoodsExample();
		example.or().andListidEqualTo(category_id);
		example.setOrderByClause("id desc");
		List<Goods> goods=goodsMapper.selectByExample(example);
		return goods;
	}

	public List<Goods> indexlist(Integer category_id) {
		    return goodsMapper.selectByLimit(category_id, 0, 8);
	}

	public void fill(Category category) {
		List<Goods> goods=indexlist(category.getId());
		category.setGoods(goods);
		
	}

	public void fill(List<Category> categories) {
		for(Category category: categories)
		   fill(category);
	}

	public List<Goods> hotlist(Integer category_id,int offset,int limit) {
		return goodsMapper.selectByHot(category_id, offset, limit);
	}

	public void add(Goods good) {
		goodsMapper.insert(good);
		
	}

	public void update(Goods good) {
		goodsMapper.updateByPrimaryKey(good);
		
	}

	public void delete(Integer id) {
		goodsMapper.deleteByPrimaryKey(id);
		
	}
	
	public int total() {
		
		return goodsMapper.total();
	}

	public List<Goods> bySales(int offset, int limit) {
		
		return goodsMapper.selectBySales(offset, limit);
	}

	public List<Goods> list(Page page) {
		return goodsMapper.list(page);
	}
   

   
}

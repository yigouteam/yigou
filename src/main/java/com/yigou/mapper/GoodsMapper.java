package com.yigou.mapper;

import com.yigou.entity.Goods;
import com.yigou.entity.GoodsExample;
import com.yigou.utils.Page;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    List<Goods> selectByExample(GoodsExample example);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

	List<Goods> selectByLimit(@Param("listid")Integer category_id,@Param("offset")int offset,@Param("limit")int limit);

	List<Goods> selectByHot(@Param("listid")Integer category_id, @Param("offset")int offset, @Param("limit")int limit);

	int total();

	List<Goods> selectBySales(@Param("offset")int offset, @Param("limit")int limit);

	List<Goods> list(Page page);
}
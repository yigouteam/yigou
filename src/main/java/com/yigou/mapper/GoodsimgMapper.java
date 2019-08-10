package com.yigou.mapper;

import com.yigou.entity.Goodsimg;
import com.yigou.entity.GoodsimgExample;
import java.util.List;

public interface GoodsimgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goodsimg record);

    int insertSelective(Goodsimg record);

    List<Goodsimg> selectByExample(GoodsimgExample example);

    Goodsimg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goodsimg record);

    int updateByPrimaryKey(Goodsimg record);

	int total();
}
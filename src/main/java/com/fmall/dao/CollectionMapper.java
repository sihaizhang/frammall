package com.fmall.dao;

import com.fmall.pojo.MyCollection;

public interface CollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MyCollection record);

    int insertSelective(MyCollection record);

    MyCollection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MyCollection record);

    int updateByPrimaryKey(MyCollection record);
}
package com.fmall.dao;

import com.fmall.pojo.Livestock;

import java.util.List;

public interface LivestockMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Livestock record);

    int insertSelective(Livestock record);

    Livestock selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Livestock record);

    int updateByPrimaryKey(Livestock record);

    List<Livestock> getAllLivestock();
}
package com.fmall.dao;

import com.fmall.pojo.Logistics;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface LogisticsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Logistics record);

    int insertSelective(Logistics record);

    void insertById(@Param("id") Double id);

    Logistics selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Logistics record);

    int updateByPrimaryKey(Logistics record);

    List<Double> getTemperature();

    List<Date> getTime();

    List<Double> getHumidity();
}
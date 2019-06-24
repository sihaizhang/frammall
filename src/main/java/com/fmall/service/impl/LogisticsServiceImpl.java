package com.fmall.service.impl;

import com.fmall.dao.LogisticsMapper;
import com.fmall.service.ILogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LogisticsServiceImpl implements ILogisticsService {
    @Autowired
    private LogisticsMapper logisticsMapper;
    @Override
    public List<Double> getTemperature() {
        return logisticsMapper.getTemperature();
    }

    @Override
    public List<Date> getTime() {
        return logisticsMapper.getTime();
    }

    @Override
    public List<Double> getHumidity() {
        return logisticsMapper.getHumidity();
    }
}

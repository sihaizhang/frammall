package com.fmall.service.impl;
import com.fmall.dao.LivestockMapper;
import com.fmall.dao.LogisticsMapper;
import com.fmall.pojo.Livestock;
import com.fmall.pojo.Logistics;
import com.fmall.service.OnenetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OnenetServiceImpl implements OnenetService {
    @Autowired
    private LogisticsMapper logisticsMapper;
    @Autowired
    private LivestockMapper liveStockMapper;


    @Override
    public void insertById(Double id) {
        logisticsMapper.insertById(id);
    }

    @Override
    public Logistics select(int i) {

        return logisticsMapper.selectByPrimaryKey(i);
    }


    public void sava(Livestock liveStock) {
        liveStockMapper.insert(liveStock);
    }

    @Override
    public void save_box(Logistics logistics) {
        logisticsMapper.insert(logistics);
    }
}

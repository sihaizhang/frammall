package com.fmall.service.impl;

import com.fmall.common.ServerResponse;
import com.fmall.dao.LivestockMapper;
import com.fmall.pojo.Livestock;
import com.fmall.service.ILivestockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iLivestockService")
public class LivestockServiceImpl implements ILivestockService {

    @Autowired
    private LivestockMapper livestockMapper;

    public ServerResponse<List<Livestock>> getAllLivestock(){
        List<Livestock> livestockList = livestockMapper.getAllLivestock();
        if(livestockList == null){
            return ServerResponse.createByErrorMessage("没有牲畜信息");
        }
        return ServerResponse.createBySuccess("查询成功",livestockList);
    }

}

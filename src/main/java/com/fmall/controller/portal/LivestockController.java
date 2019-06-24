package com.fmall.controller.portal;

import com.fmall.common.ServerResponse;
import com.fmall.pojo.Livestock;
import com.fmall.service.ILivestockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 牲畜
 */

@Controller
@RequestMapping("/livestock/")
public class LivestockController {

    @Autowired
    private ILivestockService iLivestockService;

    @RequestMapping(value = "get_all_livestock.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<List<Livestock>> getAllLivestock(){
        ServerResponse<List<Livestock>> serverResponse = iLivestockService.getAllLivestock();
        return serverResponse;
    }

}

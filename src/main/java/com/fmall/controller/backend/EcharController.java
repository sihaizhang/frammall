package com.fmall.controller.backend;

import com.fmall.service.ILogisticsService;
import com.fmall.util.DateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class EcharController {
    @Autowired
    private ILogisticsService logisticsService;
    @RequestMapping("/echar.do")
    @ResponseBody
    public Map<String,Object> echarShow(){
        Map<String,Object> map = new HashMap<>();
        //String categories[]={"衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"};
        List<Double> temperature = logisticsService.getTemperature();
        List<Date> time = logisticsService.getTime();
        List<Double> humidity = logisticsService.getHumidity();
        Collections.reverse(time);
        Collections.reverse(temperature);
        Collections.reverse(humidity);
        List<String> s_time = new ArrayList<>();
        for (Date date : time) {
            s_time.add(DateFormat.dataToString(date));
        }
        map.put("temperature",temperature);
        map.put("time",s_time);
        map.put("humidity",humidity);
        return map;
    }
}

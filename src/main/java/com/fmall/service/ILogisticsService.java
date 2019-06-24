package com.fmall.service;

import java.util.Date;
import java.util.List;

public interface ILogisticsService {
    List<Double> getTemperature();

    List<Date> getTime();

    List<Double> getHumidity();
}

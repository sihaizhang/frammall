package com.fmall.service;

import com.fmall.pojo.Livestock;
import com.fmall.pojo.Logistics;

public interface OnenetService {


    Logistics select(int i);

    void sava(Livestock liveStock);

    void save_box(Logistics logistics);
}

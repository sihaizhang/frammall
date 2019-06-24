package com.fmall.service;

import com.fmall.common.ServerResponse;
import com.fmall.pojo.Product;
import com.github.pagehelper.PageInfo;

public interface IProductService {

    /**
     * 上传商品
     * @param product
     * @return
     */
    ServerResponse<String> uploadProduct(Product product);

    /**
     * 分类展示商品
     * @param type
     * @param categoryId
     * @param pn
     * @return
     */
    ServerResponse<PageInfo> selectProductByChoice(Integer type, Integer categoryId, Integer pn);

    /**
     * 显示商品详情
     * @param productId
     * @return
     */
    Product showProductById(Integer productId);

    /**
     * 收藏商品
     * @param userId
     * @param productId
     * @return
     */
    ServerResponse<String> addCollection(Integer userId,Integer productId);
}

package com.fmall.service;

import com.fmall.common.ServerResponse;
import com.fmall.pojo.Order;
import com.fmall.vo.ProductIdAndQuantiry;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IOrderService {

    /**
     * 生成订单
     * @param userId
     * @param productId
     * @param shippingId
     * @param quantity
     * @return
     */
    ServerResponse<String> createOrder(Integer userId, Integer productId, Integer shippingId, Integer quantity);

    /**
     * 删除订单
     * @param userId
     * @param orderNo
     * @return
     */
    ServerResponse<String> deleteOrder(Integer userId,Long orderNo);

    /**
     * 查询个人订单
     * @param userId
     * @param pn
     * @return
     */
    ServerResponse<PageInfo> showOrder(Integer userId, Integer pn,Integer status);

    /**
     * 完成支付
     * @param userId
     * @param orderNo
     * @return
     */
    ServerResponse<String> pay(Integer userId,Long orderNo);

    /**
     * 查看个人购物车中已勾选的商品
     * @param userId
     * @return
     */
    List<ProductIdAndQuantiry> selectCheckedProductFromCart(Integer userId);

    /**
     * 查出指定用户被勾选的购物车好，然后将这些删除
     * @param id
     * @return
     */
    List<Integer> selectCheckedCarIdByUserId(Integer id);

    /**
     * 根据id删除购物车中的商品
     * @param cartId
     * @return
     */
    int deleteCartById(Integer cartId);

    /**
     * 商家查看订单
     * @param buyyerId
     * @param status
     * @param pn
     * @return
     */
    ServerResponse<PageInfo> selectOrderBySellerIdAndStatus(Integer buyyerId,Integer status,Integer pn);

    /*
    * 后台
    * */
    int queryByOrderNo(Long orderNo);

    List<Order> queryAllOrders(int page, int size);

    List<Order> queryOrdersByOrderNo(int page, int size, Long orderNo);

    void deleteOrderById(String id);
}

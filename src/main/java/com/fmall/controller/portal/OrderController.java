package com.fmall.controller.portal;

import com.fmall.common.Const;
import com.fmall.common.ResponseCode;
import com.fmall.common.ServerResponse;
import com.fmall.pojo.User;
import com.fmall.service.IOrderService;
import com.fmall.vo.OrderItemVo;
import com.fmall.vo.ProductIdAndQuantiry;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order/")
public class OrderController {

    @Autowired
    private IOrderService iOrderService;

    /**
     * 生成订单
     * @param session
     * @param productId
     * @param shippingId
     * @param quantity
     * @return
     */
    @RequestMapping(value = "create.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> create(HttpSession session,Integer productId,Integer shippingId ,Integer quantity){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        // 生成订单
        ServerResponse<String> serverResponse = iOrderService.createOrder(user.getId(), productId, shippingId, quantity);
        return serverResponse;
    }

    /**
     * 将购物车中已勾选的商品下单
     * @param session
     * @param shippingId
     * @return
     */
    @RequestMapping(value = "create_order_from_cart.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> createOrderByCheckedFromCart(HttpSession session,Integer shippingId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        // 1、查出购物车中已勾选的商品的productId,quantity
        List<ProductIdAndQuantiry> productIdAndQuantiryList = iOrderService.selectCheckedProductFromCart(user.getId());
        if(productIdAndQuantiryList == null){
            return ServerResponse.createByErrorMessage("当前购物车中没有被选中的商品");
        }
        // 2、一一下单
        for(ProductIdAndQuantiry productIdAndQuantiry : productIdAndQuantiryList){
            ServerResponse<String> serverResponse = iOrderService.createOrder(user.getId(), productIdAndQuantiry.getProductId(), shippingId, productIdAndQuantiry.getQuantity());
            if(!serverResponse.isSuccess()){
                return ServerResponse.createByErrorMessage("下单失败了");
            }
        }
        // 下单后删除购物车中的商品
        List<Integer> checkedCartList = iOrderService.selectCheckedCarIdByUserId(user.getId());
        for(Integer checkedItem : checkedCartList){
            // 通过id删除购物车中的商品
            int resultCount = iOrderService.deleteCartById(checkedItem);
            if(resultCount == 0){
                return ServerResponse.createByErrorMessage("删除购物车商品这里出了问题");
            }
        }
        return ServerResponse.createBySuccessMessage("下单成功");
    }

    /**
     * 删除订单
     * @param session
     * @param orderNo
     * @return
     */
    @RequestMapping(value = "delete.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> delete(HttpSession session,Long orderNo){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        ServerResponse<String> stringServerResponse = iOrderService.deleteOrder(user.getId(), orderNo);
        return stringServerResponse;
    }

    /**
     * 展示个人的订单,根据不同的选择，默认查询全部
     * @param session
     * @return
     */
    @RequestMapping(value = "show_order.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<PageInfo> showOrder(HttpSession session,@RequestParam(value = "pn",defaultValue = "1") Integer pn
            ,@RequestParam(value = "status",defaultValue = "0") Integer status){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        ServerResponse<PageInfo> pageInfoServerResponse = iOrderService.showOrder(user.getId(), pn,status);
        return pageInfoServerResponse;
    }

    /**
     * 支付
     * @param session
     * @param orderNo
     * @return
     */
    @RequestMapping(value = "pay.do",method = RequestMethod.POST)
    @ResponseBody
        public ServerResponse<String> pay(HttpSession session,Long orderNo){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        // 更新order表的收货地址
        // 更新订单状态
        ServerResponse<String> serverResponse = iOrderService.pay(user.getId(), orderNo);
        return serverResponse;
    }


    /** _______________________________________________________________________________ **/
    /** ----------------------------- 卖家查询订单 -------------------------------------- **/
    /** _______________________________________________________________________________ **/

    @RequestMapping(value = "select_order_seller_id_type.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<PageInfo> selectOrderBySellerIdAndStatus(HttpSession session
            ,@RequestParam(value = "status",defaultValue = "0") Integer status
            ,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        if(user.getRole() != 1){
            return ServerResponse.createByErrorMessage("你不是卖家的身份");
        }
        // todo 查询除购买了该卖家商品的所有订单
        //IOrderService
        ServerResponse<PageInfo> pageInfoServerResponse = iOrderService.selectOrderBySellerIdAndStatus(user.getId(), status, pn);
        return pageInfoServerResponse;
    }

}

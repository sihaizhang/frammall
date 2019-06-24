package com.fmall.service;

import com.fmall.common.ServerResponse;
import com.fmall.pojo.User;

public interface IUserService {

    /**
     * 注册用户
     * @param user
     * @return
     */
    ServerResponse<String> register(User user);

    /**
     * 登录用户
     * @param username
     * @param password
     * @return
     */
    ServerResponse<User> login(String username,String password);

    /**
     * 通过用户名找到密保问题
     * @param username
     * @return
     */
    ServerResponse<String> forgetGetQuestion(String username);

    /**
     * 校验密保问题是否正确
     * @param username
     * @param question
     * @param answer
     * @return
     */
    ServerResponse<String> forgetCheckAnswer(String username,String question,String answer);

    /**
     * 重新找回密码
     * @param username
     * @param passwordNew
     * @return
     */
    ServerResponse<String> forgetResetQuestion(String username,String passwordNew);

    /**
     * 重置密码
     * @param username
     * @param passwordOld
     * @param passwordNew
     * @return
     */
    ServerResponse<String> resetPassword(String username,String passwordOld,String passwordNew);

    /**
     * 查看是否为管理员
     * @param username
     * @return
     */
    ServerResponse checkAdminRole(String username);

    /**
     * 申请成为卖家
     * @param user
     * @return
     */
    ServerResponse<String> applyShop(User user);

    /**
     * 查询店家
     * @param userId
     * @return
     */
    ServerResponse<User> getSellerInfo(Integer userId);

    /**
     * 获取登录用户信息
     * @param userId
     * @return
     */
    ServerResponse<User> getUserInfoByUserId(Integer userId);
}

package com.fmall.controller.portal;

import com.fmall.common.Const;
import com.fmall.common.ResponseCode;
import com.fmall.common.ServerResponse;
import com.fmall.pojo.User;
import com.fmall.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
// localhost:8888/fmall/user/register.do
@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService iUserService;

    @RequestMapping(value = "login.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> login(String username, String password, HttpSession session){
        ServerResponse<User> response = iUserService.login(username, password);
        if(response.isSuccess()){
            session.setAttribute(Const.CURRENT_USER,response.getData());
        }
        return response;
    }

    @RequestMapping(value = "register.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> register(User user){
        return iUserService.register(user);
    }

    /**
     * 获取密保问题
     * @param username
     * @return
     */
    @RequestMapping(value = "forget_get_question.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<String> forgetGetQuestion(String username){
        ServerResponse<String> serverResponse = iUserService.forgetGetQuestion(username);
        return serverResponse;
    }

    /**
     * 校验密保答案
     * @param username
     * @param question
     * @param answer
     * @return
     */
    @RequestMapping(value = "forget_check_answer.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetCheckAnswer(String username,String question,String answer){
        ServerResponse<String> serverResponse = iUserService.forgetCheckAnswer(username, question, answer);
        return serverResponse;
    }

    /**
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "forget_reset_password.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetResetQuestion(String username,String passwordNew){
        System.out.println("新密码："+passwordNew);
        return iUserService.forgetResetQuestion(username,passwordNew);
    }

    /**
     * 重置密码
     * @param username
     * @param passwordOld
     * @param passwordNew
     * @return
     */
    @RequestMapping(value = "reset_password.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> resetPassword(String username,String passwordOld,String passwordNew){
        System.out.println(username+":"+passwordOld+":"+passwordNew);
        ServerResponse<String> serverResponse = iUserService.resetPassword(username, passwordOld, passwordNew);
        return serverResponse;
    }

    @RequestMapping(value = "apply_to_open_shop.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> applyToOpenningShop(HttpSession session,String username,String phone,String shopName){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请先登录");
        }
        // 判断输入的用户名与session中的用户名是否一致
        if(!user.getUsername().equals(username)){
            return ServerResponse.createByErrorMessage("输入的用户名与当前登录用户的用户名不一致，请重新输入");
        }else if(!user.getPhone().equals(phone)){
            return ServerResponse.createByErrorMessage("输入的电话与当前登录用户的电话不一致，请重新输入");
        }
        // 如果已经是店家就也不能申请
        if(user.getRole() == Const.Role.ROLE_SELLER){
            return ServerResponse.createByErrorMessage("你已经是店家");
        }
        // 更新数据库

        user.setShopName(shopName);
        user.setRole(Const.Role.APPLY_OPEN_SHOP);

        ServerResponse<String> stringServerResponse = iUserService.applyShop(user);
        return stringServerResponse;
    }

    /**
     * 通过商品的店家id获取该店家的用户名和店名
     * @param userId
     * @return
     */
    @RequestMapping(value = "get_seller_info.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<User> getSellerInfo(Integer userId){
        ServerResponse<User> serverResponse = iUserService.getSellerInfo(userId);
        return serverResponse;
    }

    /**
     * 查看当前登录用户信息
     * @param session
     * @return
     */
    @RequestMapping(value = "get_user_info.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<User> getUserInfo(HttpSession session){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请先登录");
        }
        // 查询当前登录用户信息
        ServerResponse<User> userInfoByUserId = iUserService.getUserInfoByUserId(user.getId());
        return userInfoByUserId;
    }


}

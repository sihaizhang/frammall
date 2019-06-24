package com.fmall.dao;

import com.fmall.common.ServerResponse;
import com.fmall.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int checkUsername(String username);

    int checkEmail(String email);

    User selectLogin(@Param("username") String username,@Param("password") String password);

    String getQuestion(String username);

    int checkAnswer(@Param("username") String username,@Param("question") String question,@Param("answer") String answer);

    int checkPasswordOld(@Param("username") String username,@Param("passwordOld") String passwordOld);

    int resetPassword(@Param("username")String username,@Param("passwordNew") String passwordNew);

    int checkRole(String username);
}
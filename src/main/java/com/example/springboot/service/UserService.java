package com.example.springboot.service;

import com.example.springboot.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {
    //登录
    User login(String name, String password);

    boolean register(User user);
}

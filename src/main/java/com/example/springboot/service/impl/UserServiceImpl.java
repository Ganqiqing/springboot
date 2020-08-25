package com.example.springboot.service.impl;

import com.example.springboot.dao.UserMapper;
import com.example.springboot.pojo.User;
import com.example.springboot.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User login(String name, String password) {
        return userMapper.login(name, password);
    }

    @Override
    public boolean register(User user) {
        return userMapper.register(user);
    }
}

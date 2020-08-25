package com.example.springboot.dao;

import com.example.springboot.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    User login(@Param("name") String name, @Param("password") String password);

    boolean register(User user);
}

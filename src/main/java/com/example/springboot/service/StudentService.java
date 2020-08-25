package com.example.springboot.service;

import com.example.springboot.pojo.Student;

import java.util.List;

public interface StudentService {
    //查询所有
    public List<Student> selectAll();
    //删除
    public boolean delStu(Integer id);
}

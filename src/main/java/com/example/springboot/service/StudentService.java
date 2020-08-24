package com.example.springboot.service;

import com.example.springboot.pojo.Student;

import java.util.List;

public interface StudentService {
    public List<Student> selectAll();
    public boolean delStu(Integer id);
}

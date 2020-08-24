package com.example.springboot.service.impl;

import com.example.springboot.dao.StudentMapper;
import com.example.springboot.pojo.Student;
import com.example.springboot.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    StudentMapper studentMapper;

    @Override
    public List<Student> selectAll() {
        return studentMapper.selectAll();
    }

    @Override
    public boolean delStu(Integer id) {
        return studentMapper.delStu(id);
    }
}

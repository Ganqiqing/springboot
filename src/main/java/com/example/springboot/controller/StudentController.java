package com.example.springboot.controller;

import com.example.springboot.pojo.Student;
import com.example.springboot.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
    //@Resource
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/index")
    public String student() {
        return "index";
    }

    @RequestMapping("list")
    public ModelAndView list() {
        ModelAndView view = new ModelAndView();
        List<Student> students = studentService.selectAll();
        view.addObject("students", students);
        view.setViewName("student");
        return view;
    }

    @RequestMapping(value = "del")
    @ResponseBody
    String del(Integer id){
        String result = "{\"result\":\"error\"}";
        if (studentService.delStu(id)){
            result = "{\"result\":\"success\"}";
            return result;
        }else {
            return result;
        }
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public List<Student> selectAll() {
        List<Student> students = studentService.selectAll();
        return students;
    }
}

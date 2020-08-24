package com.example.springboot.controller;

import com.example.springboot.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/test")
public class UserController {
    @RequestMapping(value = "/hello")
    public String get(Model model) {
        List<User> userList=new ArrayList<>();
        userList.add(new User(1,"q",1));
        userList.add(new User(1,"w",1));
        userList.add(new User(1,"e",1));
        model.addAttribute("list",userList);
        return "hello";
    }
}

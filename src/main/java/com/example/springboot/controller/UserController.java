package com.example.springboot.controller;

import com.example.springboot.pojo.User;
import com.example.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/test")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/hello")
    public String get(Model model) {
        List<User> userList = new ArrayList<>();
        userList.add(new User(1, "q", "1"));
        userList.add(new User(1, "w", "2"));
        userList.add(new User(1, "e", "3"));
        model.addAttribute("list", userList);
        return "hello";
    }

    @RequestMapping(value = "/index")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/doLogin")
    @ResponseBody
    public String doLogin(String name, String password, HttpServletRequest request, HttpSession session) {
        System.out.println(name + "" + password);
        String result = "{\"result\":\"error\"}";
        User user = userService.login(name, password);
        if (user != null) {
            result = "{\"result\":\"success\"}";
            session.setAttribute("user", user);
            return result;
        } else {
            return result;
        }
    }

    @RequestMapping("/registering")
    @ResponseBody
    public String registering(User user) {
        String result = "{\"result\":\"error\"}";
        if (userService.register(user)) {
            result = "{\"result\":\"success\"}";
            return result;
        } else {
            return result;
        }
    }
}

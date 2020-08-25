package com.example.springboot.test;

import com.example.springboot.SpringbootApplication;
import com.example.springboot.dao.StudentMapper;
import com.example.springboot.pojo.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = {SpringbootApplication.class})
public class StuTest {
    @Autowired
    private StudentMapper studentMapper;

    @Test
    public void List() {
        Student student = new Student();
        student.setName("木易");
        List<Student> students = studentMapper.getList(student);
        System.out.println(students);
    }

    @Test
    public void someList() {
        List<Student> students = studentMapper.someList("木易", 17);
        System.out.println(students);
    }

    @Test
    public void inList() {
        //使用list
        List<Integer> integerList = new ArrayList<>();
        integerList.add(8);
        integerList.add(9);
        integerList.add(10);
        List<Student> studentList = studentMapper.inList(integerList);
        System.out.println(studentList);
        //使用array
        int[] arrays = new int[3];
        arrays[0] = 9;
        arrays[1] = 10;
        arrays[2] = 11;
        List<Student> studentArray = studentMapper.inArray(arrays);
        System.out.println(studentArray);
        //使用map
        Map<String, Object> map = new HashMap<>();
        map.put("list", integerList);
        List<Student> studentMap = studentMapper.inMap(map);
        System.out.println(studentMap);
    }

    @Test
    public void update() {
        Student student = new Student(9, "暖风", 18);
        boolean first = studentMapper.updateFirst(student);
        boolean second = studentMapper.updateSec(student);
        System.out.println(first + "-----" + second);
    }
}

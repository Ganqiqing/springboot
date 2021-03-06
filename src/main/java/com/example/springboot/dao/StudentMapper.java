package com.example.springboot.dao;

import com.example.springboot.pojo.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

//@Repository
//扫面映射
@Mapper
public interface StudentMapper {
    public List<Student> selectAll();

    public boolean delStu(Integer id);

    //下面的都是动态SQL的语句不用

    public List<Student> getList(Student student);

    public List<Student> someList(@Param("name") String name, @Param("age") Integer age);

    public List<Student> inList(List list);

    public List<Student> inArray(int[] array);

    public List<Student> inMap(Map<String, Object> map);

    public boolean updateFirst(Student student);

    public boolean updateSec(Student student);
}

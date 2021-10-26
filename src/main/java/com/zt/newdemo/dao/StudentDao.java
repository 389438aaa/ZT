package com.zt.newdemo.dao;

import com.zt.newdemo.domain.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component("studentDao")
public interface StudentDao {
    int insertStudent(@Param("student") Student student);

    int deleteStudentById(@Param("sid") Integer sid);

    int updateStudentById(@Param("student") Student student);

    List<Student> selectStudentLimit(@Param("pageStart")Integer pageStart, @Param("pageSize") Integer pageSize);

    List<Student> selectStudentByClassNameLimit(@Param("class_id") Integer class_id, @Param("pageStart") Integer pageStart, @Param("pageSize") Integer pageSize);

    int insertStudentList(@Param("studentList") List<Student> studentList);

    List<Student> selectStudentById(@Param("sid") Integer sid);

    int deleteStudentsByIds(@Param("ids") int[] ids);

    int updateStudentsById(@Param("students") List<Student> students);
}

package com.zt.newdemo.service;

import com.zt.newdemo.domain.Student;

import java.util.List;

public interface StudentService {

    List<Student> selectStudentById(Integer sid);

    int insertStudent(Student student);

    int deleteStudentById(Integer sid);

    int updateStudentById(Student student);

    List<Student> selectStudentLimit(Integer pageStart, Integer pageSize);

    List<Student> selectStudentByClassNameLimit(Integer class_id, Integer pageStart, Integer pageSize);

    int insertStudentList(List<Student> studentList);

    int deleteStudentsByIds(int[] ids);

    int updateStudentsById(List<Student> students);
}

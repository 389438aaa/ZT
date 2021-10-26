package com.zt.newdemo.controller;


import com.zt.newdemo.domain.Student;
import com.zt.newdemo.service.StudentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {
    @Autowired
    StudentService studentService;


    /*根据学生ID查询学生信息*/
    @ResponseBody
    @RequestMapping("selectStudentById")
    public List<Student> selectStudentById(@RequestParam("sid") Integer sid) {
        System.out.println(sid);
        return studentService.selectStudentById(sid);
    }

    /*新增学生*/
    @ResponseBody
    @RequestMapping("insertStudent")
    public String insertStudent(@RequestBody Student student) {
        int i = studentService.insertStudent(student);
        if (i > 0) {
            return "成功插入主键为" + student.getSid() + "的数据.";
        } else {
            return "插入失败！";
        }
    }

    @ResponseBody
    @RequestMapping("deleteStudentById")
    public String deleteStudentById(@RequestParam("sid") Integer sid) {
        int i = studentService.deleteStudentById(sid);
        if (i > 0) {
            return "成功删除主键为" + sid + "的数据.";
        } else {
            return "删除失败！";
        }
    }

    /*根据id更新学生*/
    @ResponseBody
    @RequestMapping("updateStudentById")
    public String updateStudentById(@RequestBody Student student) {
        int i = studentService.updateStudentById(student);
        if (i > 0) {
            return "成功更新主键为" + student.getSid() + "的数据.";
        } else {
            return "更新失败！";
        }
    }

    /*单表分页*/
    @ResponseBody
    @RequestMapping("selectStudentLimit/{pageStart}/{pageSize}")
    public List<Student> selectStudentLimit(@PathVariable("pageStart") Integer pageStart, @PathVariable("pageSize") Integer pageSize) {
        System.out.println(pageSize + "  " + pageStart);
        List<Student> students;
        if(pageStart<1){
             students=null;
             return students;
        }
        students = studentService.selectStudentLimit(pageStart - 1, pageSize);
        return students;
    }

    /*stduent class 联表查询分页*/
    @ResponseBody
    @RequestMapping("selectStudentByClassNameLimit")
    public List<Student> selectStudentByClassNameLimit(
            @RequestParam("class_id") Integer class_id, @RequestParam("pageStart") Integer pageStart,
            @RequestParam("pageSize") Integer pageSize
    ) {
        System.out.println(class_id + " " + pageStart + "  " + pageSize);
        List<Student> students=studentService.selectStudentByClassNameLimit(class_id,pageStart-1,pageSize);
        return students;
    }
    /*批量插入student*/
    @ResponseBody
    @RequestMapping("insertStudentList")
    public String insertStudentList(@RequestBody List<Student> students){
        int i = studentService.insertStudentList(students);
        for (Student s :
                students) {
            System.out.println(s.getSid());
        }
        if (i>0){
            return "添加成功！";
        }
        else {return "添加失败！";}
    }
    /*批量删除学生信息根据id*/
    @ResponseBody
    @RequestMapping("deleteStudents")
    public  String deleteStudents(@RequestBody int[] ids){
        System.out.println(ids[0]);
        int i=studentService.deleteStudentsByIds(ids);
        return i>0?"成功":"失败";
    }
    /*批量更新学生数据 根据id*/
    @ResponseBody
    @RequestMapping("updateStudentsById")
    public String updateStudentsById(@RequestBody  List<Student> students){
        for (Student s :
                students) {
            System.out.println(s.getSid()+":"+s.getSname());
        }
        int i=studentService.updateStudentsById(students);
        return i>0?"成功":"失败";
    }

}

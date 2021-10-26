package com.zt.newdemo.service.serviceImpl;

import com.zt.newdemo.dao.StudentDao;
import com.zt.newdemo.domain.Student;
import com.zt.newdemo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDao;
    public List<Student> selectStudentById(Integer sid) {
        return studentDao.selectStudentById(sid);
    }

    @Override
    public int insertStudent(Student student) {
        return studentDao.insertStudent(student);
    }

    @Override
    public int deleteStudentById(Integer sid) {
        return studentDao.deleteStudentById(sid);
    }

    @Override
    public int updateStudentById(Student student) {
        return studentDao.updateStudentById(student);
    }

    @Override
    public List<Student> selectStudentLimit(Integer pageStart, Integer pageSize) {
        return studentDao.selectStudentLimit(pageStart,pageSize);
    }

    @Override
    public List<Student> selectStudentByClassNameLimit(Integer class_id, Integer pageStart, Integer pageSize) {
        return studentDao.selectStudentByClassNameLimit(class_id,pageStart,pageSize);
    }

    @Override
    public int insertStudentList(List<Student> studentList) {
        return studentDao.insertStudentList(studentList);
    }

    @Override
    public int deleteStudentsByIds(int[] ids) {
        return studentDao.deleteStudentsByIds(ids);
    }

    @Override
    public int updateStudentsById(List<Student> students) {
        return studentDao.updateStudentsById(students);
    }
}

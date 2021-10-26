package com.zt.newdemo;

import com.zt.newdemo.domain.Student;
import com.zt.newdemo.domain.extend.StudentExtend;
import org.springframework.stereotype.Component;

@Component
public class MyTest {
    public static void main(String[] args) {
        Student student=new StudentExtend();


    }
}

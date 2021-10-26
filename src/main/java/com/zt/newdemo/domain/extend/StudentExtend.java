package com.zt.newdemo.domain.extend;

import com.zt.newdemo.domain.Class;
import com.zt.newdemo.domain.Student;

public class StudentExtend extends Student {
    private Class aClass;

    public Class getaClass() {
        return aClass;
    }

    public void setaClass(Class aClass) {
        this.aClass = aClass;
    }
}

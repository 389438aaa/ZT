package com.zt.newdemo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.zt.newdemo.dao")
public class NewdemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(NewdemoApplication.class, args);
    }

}

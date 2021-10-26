/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2021-10-26 16:52:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL COMMENT '登录名',
  `admin_password` varchar(255) NOT NULL COMMENT '密码',
  `admin_nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin1', '123', 'admin');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(11) DEFAULT NULL,
  `class_tid` int(11) DEFAULT NULL COMMENT '班主任',
  PRIMARY KEY (`class_id`),
  KEY `fk_tid` (`class_tid`),
  CONSTRAINT `fk_tid` FOREIGN KEY (`class_tid`) REFERENCES `teacher` (`tid`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '1班', '1');
INSERT INTO `class` VALUES ('2', '2班', '2');
INSERT INTO `class` VALUES ('3', '3班', '3');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL,
  `cname` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '语文');
INSERT INTO `course` VALUES ('2', '数学');
INSERT INTO `course` VALUES ('3', '英语');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `g_sid` int(11) NOT NULL,
  `g_cid` int(11) NOT NULL COMMENT '课程id',
  `grades` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`g_sid`,`g_cid`),
  KEY `fk_cid` (`g_cid`),
  CONSTRAINT `fk_cid` FOREIGN KEY (`g_cid`) REFERENCES `course` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sid` FOREIGN KEY (`g_sid`) REFERENCES `student` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '1', '90');
INSERT INTO `grade` VALUES ('1', '2', '91');
INSERT INTO `grade` VALUES ('1', '3', '40');
INSERT INTO `grade` VALUES ('2', '1', '99');
INSERT INTO `grade` VALUES ('2', '2', '99');
INSERT INTO `grade` VALUES ('2', '3', '50');
INSERT INTO `grade` VALUES ('3', '1', '88');
INSERT INTO `grade` VALUES ('3', '2', '82');
INSERT INTO `grade` VALUES ('3', '3', '57');
INSERT INTO `grade` VALUES ('4', '1', '87');
INSERT INTO `grade` VALUES ('4', '2', '76');
INSERT INTO `grade` VALUES ('4', '3', '77');
INSERT INTO `grade` VALUES ('5', '1', '98');
INSERT INTO `grade` VALUES ('5', '2', '92');
INSERT INTO `grade` VALUES ('5', '3', '89');
INSERT INTO `grade` VALUES ('6', '1', '88');
INSERT INTO `grade` VALUES ('6', '2', '56');
INSERT INTO `grade` VALUES ('6', '3', '98');
INSERT INTO `grade` VALUES ('7', '1', '78');
INSERT INTO `grade` VALUES ('7', '2', '67');
INSERT INTO `grade` VALUES ('7', '3', '99');
INSERT INTO `grade` VALUES ('8', '1', '98');
INSERT INTO `grade` VALUES ('8', '2', '98');
INSERT INTO `grade` VALUES ('8', '3', '');
INSERT INTO `grade` VALUES ('9', '1', '98');
INSERT INTO `grade` VALUES ('9', '2', '88');
INSERT INTO `grade` VALUES ('9', '3', '67');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_class_id` (`class_id`),
  CONSTRAINT `fk_class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '赵一', '11', '男', '四川巴中', '1');
INSERT INTO `student` VALUES ('2', '钱一', '9', '男', '四川成都', '1');
INSERT INTO `student` VALUES ('3', '孙三', '8', '男', '四川达州', '1');
INSERT INTO `student` VALUES ('4', '李四', '12', '男', '四川攀枝花', '2');
INSERT INTO `student` VALUES ('5', '周五', '11', '男', '四川宜宾', '2');
INSERT INTO `student` VALUES ('6', '吴六', '12', '男', '四川泸州', '2');
INSERT INTO `student` VALUES ('7', '郑七', '10', '男', '四川广元', '3');
INSERT INTO `student` VALUES ('8', '王八', '12', '男', '四川绵阳', '3');
INSERT INTO `student` VALUES ('9', '何家欢', '13', '男', '四川内江', '3');
INSERT INTO `student` VALUES ('10', '吴九', '11', '男', '四川巴中', '1');
INSERT INTO `student` VALUES ('13', '学生0', '11', '男', '四川遂宁0', '1');
INSERT INTO `student` VALUES ('14', '学生1', '11', '男', '四川遂宁1', '1');
INSERT INTO `student` VALUES ('15', '学生2', '11', '男', '四川遂宁2', '1');
INSERT INTO `student` VALUES ('16', '更该学生1', '11', '男', '四川遂宁', '1');
INSERT INTO `student` VALUES ('17', '更该学生2', '11', '男', '四川遂宁', '1');
INSERT INTO `student` VALUES ('18', '更该学生3', '11', '男', '四川遂宁', '1');
INSERT INTO `student` VALUES ('19', '更该学生4', '11', '男', '四川遂宁', '1');
INSERT INTO `student` VALUES ('20', '学生2', '11', '男', '四川遂宁2', '1');
INSERT INTO `student` VALUES ('31', '新增学生1', '11', '男', '四川遂宁', '1');
INSERT INTO `student` VALUES ('32', '新增学生2', '11', '男', '四川遂宁', '1');
INSERT INTO `student` VALUES ('33', '新增学生3', '11', '男', '四川遂宁', '1');
INSERT INTO `student` VALUES ('34', '新增学生4', '11', '男', '四川遂宁', '1');

-- ----------------------------
-- Table structure for student_copy
-- ----------------------------
DROP TABLE IF EXISTS `student_copy`;
CREATE TABLE `student_copy` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_class_id` (`class_id`),
  CONSTRAINT `student_copy_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_copy
-- ----------------------------
INSERT INTO `student_copy` VALUES ('1', 'name1', '1', '男', '四川巴中', '1');
INSERT INTO `student_copy` VALUES ('2', 'name2', '2', '男', '四川成都', '1');
INSERT INTO `student_copy` VALUES ('3', 'name3', '3', '男', '四川达州', '1');
INSERT INTO `student_copy` VALUES ('4', '李四', '12', '男', '四川攀枝花', '2');
INSERT INTO `student_copy` VALUES ('5', '周五', '11', '男', '四川宜宾', '2');
INSERT INTO `student_copy` VALUES ('6', '吴六', '12', '男', '四川泸州', '2');
INSERT INTO `student_copy` VALUES ('7', '郑七', '10', '男', '四川广元', '3');
INSERT INTO `student_copy` VALUES ('8', '王八', '12', '男', '四川绵阳', '3');
INSERT INTO `student_copy` VALUES ('9', '何家欢', '13', '男', '四川内江', '3');
INSERT INTO `student_copy` VALUES ('10', '吴九', '11', '男', '四川巴中', '1');
INSERT INTO `student_copy` VALUES ('13', '学生0', '11', '男', '四川遂宁0', '1');
INSERT INTO `student_copy` VALUES ('14', '13', '112', '男', '四川遂宁1', '1');
INSERT INTO `student_copy` VALUES ('15', '15', '112', '男', '四川遂宁2', '1');
INSERT INTO `student_copy` VALUES ('16', '更该学生11', '11', '男', '四川遂宁', '1');
INSERT INTO `student_copy` VALUES ('17', '更该学生12', '11', '男', '四川遂宁', '1');
INSERT INTO `student_copy` VALUES ('18', '更该学生13', '11', '男', '四川遂宁', '1');
INSERT INTO `student_copy` VALUES ('19', '更该学生14', '11', '男', '四川遂宁', '1');
INSERT INTO `student_copy` VALUES ('20', '学生2', '11', '男', '四川遂宁2', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `tname` varchar(11) DEFAULT NULL,
  `tcourse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `fk_course_cid` (`tcourse_id`),
  CONSTRAINT `fk_course_cid` FOREIGN KEY (`tcourse_id`) REFERENCES `course` (`cid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '张老师', '1');
INSERT INTO `teacher` VALUES ('2', '王老师', '2');
INSERT INTO `teacher` VALUES ('3', '李老师', '3');

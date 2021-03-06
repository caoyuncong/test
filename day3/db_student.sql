DROP DATABASE IF EXISTS db_student;
CREATE DATABASE db_student;

-- table student
DROP TABLE IF EXISTS db_student.student;
CREATE TABLE db_student.student (
  id           INT          AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name         VARCHAR(255) NOT NULL
  COMMENT '学生姓名',
  age          INT COMMENT '年龄',
  gender       VARCHAR(255) DEFAULT '男'
  COMMENT '性别',
  dob          DATE COMMENT '出生日期',
  departmentId INT COMMENT 'FK'
)
  COMMENT '学生表';

-- table department
DROP TABLE IF EXISTS db_student.department;
CREATE TABLE db_student.department (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
  COMMENT '系名称',
  tel   VARCHAR(255) COMMENT '电话'
)
  COMMENT '系别表';

-- table course
DROP TABLE IF EXISTS db_student.course;
CREATE TABLE db_student.course (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title  VARCHAR(255) NOT NULL
  COMMENT '课程名称',
  credit INT COMMENT '学分'
)
  COMMENT '课程表';

-- table student_course
DROP TABLE IF EXISTS db_student.student_course;
CREATE TABLE db_student.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  studentId INT COMMENT 'FK',
  courseId  INT COMMENT 'FK',
  grade     INT COMMENT '成绩'
)
  COMMENT '学生选课表';

-- FK
ALTER TABLE db_student.student
  ADD CONSTRAINT
  fk_student_departmentId -- alias 别名\ [ˈeɪliəs]
FOREIGN KEY (departmentId)
REFERENCES db_student.department (id);

ALTER TABLE db_student.student_course
  ADD CONSTRAINT
  fk_student_course_studentId
FOREIGN KEY (studentId)
REFERENCES db_student.student (id)
  ON DELETE SET NULL;

ALTER TABLE db_student.student_course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_student.course (id);

-- -----------------------------
INSERT INTO db_student.student VALUES (NULL, 'Jenny', 32, '女', '1984-5-6', NULL);
INSERT INTO db_student.student (name, age, dob) VALUES ('Jen', 32, '1982-8-9');

SELECT *
FROM db_student.student;

INSERT INTO db_student.department VALUES (NULL, 'CS', '111');
INSERT INTO db_student.department VALUES (NULL, 'SS', '211');
INSERT INTO db_student.department VALUES (NULL, 'EE', '311');

SELECT *
FROM db_student.department;

INSERT INTO db_student.course VALUES (NULL, 'HTML', 1);
INSERT INTO db_student.course VALUES (NULL, 'Java', 2);
INSERT INTO db_student.course VALUES (NULL, 'CSS', 3);

SELECT *
FROM db_student.course;

INSERT INTO db_student.student_course VALUES (NULL, 1, 1, NULL);
INSERT INTO db_student.student_course VALUES (NULL, 1, 2, NULL);
INSERT INTO db_student.student_course VALUES (NULL, 2, 1, NULL);
INSERT INTO db_student.student_course VALUES (NULL, 2, 3, NULL);

SELECT *
FROM db_student.student_course;

UPDATE db_student.student
SET departmentId = 1
WHERE id = 1;

UPDATE db_student.student
SET departmentId = 2
WHERE id = 2;

SELECT *
FROM db_student.student;

DELETE FROM db_student.student
WHERE id = 1;
#
# SELECT *
# FROM db_student.student_course;

-- ------------------------
# -- 显示表结构
# DESC db_student.student;
#
# -- 显示表中列信息，包括注释
# SHOW FULL COLUMNS FROM db_student.student;
#
# -- 显示建表语句
# SHOW CREATE TABLE db_student.student;
#
# -- 显示库中所有表信息，包括表注释
# SHOW TABLE STATUS FROM db_student;
#
# -- 显示表信息，包括注释
# USE db_student;
# SHOW TABLE STATUS
# WHERE Name = 'student';
-- -------------------------------------




SHOW DATABASES;

-- DDL: CREATE ALTER DROP
CREATE DATABASE day2;
# ALTER DATABASE day2...
DROP DATABASE day2;

USE day2;
SHOW TABLES;

# CREATE TABLE ...
# ALTER TABLE ...
# DROP TABLE...

# char(size) 定长字符类型 若小于，用0补齐，varchar不用
# varchar(255) 可变长字符类型 最大为255，超过了转换为text

CREATE TABLE day2.user (
  # AUTO_INCREMENT 自动增长
  id     INT(1) AUTO_INCREMENT PRIMARY KEY, -- INT括号内数值为展示宽度 unsigned 无符号（负号）范围为原来范围的2倍
  name   VARCHAR(255),
  height DOUBLE(3, 2), -- 2 为小数部分，3-2 为整数部分， 这一点与 decimal同
  price  DECIMAL(6, 2), -- 与金钱有关 用decimal 精确，double 不精确
  dob    DATE,
  time   DATETIME
);
DESC day2.user; # --describe DESC 描述

SELECT *
FROM day2.user; -- 结果集

DROP TABLE day2.user;

UPDATE day2.user
SET height = 1.80, name = 'tester'
WHERE id = 1;

INSERT INTO day2.user VALUES (NULL, 'fjsd', 1.755, 1255.555, '1982-2-3', '2017-1-5 11:05:6');

SHOW TABLES;
-- entity
CREATE TABLE student (
  id           INT          AUTO_INCREMENT PRIMARY KEY, -- 主键约束不能为空，且唯一 主关键字 主键 主码
  name         VARCHAR(255) NOT NULL,
  gender       VARCHAR(255) DEFAULT '男',
  age          INT CHECK (age > 17), -- 检查完整性约束在MySQL中不起作用，
  dob          DATE UNIQUE,
  #   department VARCHAR(255)
  departmentId INT,

  # 关于主表删除，先删除从表，后删除主表,用delete也是这样
  # 外键关联必须是从表的外键关联主表的主键 且字段范围相同，
  # 若主表没有主键，不能创建外键关联，或关联字段的范围不同，不能创建外键关联
  #   先创建主表，后创建从表，先删除从表，后删除主表
  #   CONSTRAINT FOREIGN KEY (departmentId) REFERENCES day2.department (id)写在从表中
  CONSTRAINT FOREIGN KEY (departmentId) REFERENCES day2.department (id)
    #     ON DELETE CASCADE -- 级联 cascade 删除  set null 置空
    ON DELETE RESTRICT
    ON UPDATE NO ACTION
);

DROP TABLE day2.student;

ALTER TABLE day2.student
  AUTO_INCREMENT = 10000; -- 初始值从10000开始自增

DESC day2.student;

SELECT *
FROM day2.student;

INSERT INTO day2.student VALUES (3, 'zhangsan', '男', 15, NULL, 1); -- null
INSERT INTO day2.student VALUES (NULL, 'lisi', '男',NULL, 2); -- null
INSERT INTO day2.student VALUES (NULL, 'wanger', 15, NULL, 3); -- null
INSERT INTO day2.student VALUES (NULL ); -- null

UPDATE day2.student
SET department = 'EE'
WHERE id = 3;


DELETE FROM day2.student
WHERE id = 11;
DELETE FROM day2.student
WHERE dob = '';

-- table department entity
CREATE TABLE day2.department (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  dname VARCHAR(255) NOT NULL,
  tel   VARCHAR(255)
);

USE day2;
SHOW TABLES ;
DESC day2.department;
SELECT *
FROM day2.department;

INSERT INTO day2.department VALUES (NULL, 'CS', '123');
INSERT INTO day2.department VALUES (NULL, 'EE', '563');
INSERT INTO day2.department VALUES (NULL, 'SS', '183');

DROP TABLE day2.department;
TRUNCATE TABLE day2.department; -- dangerous

DELETE FROM day2.department
WHERE id = 4;

UPDATE day2.department
SET id = 4
WHERE id = 2;

SELECT *
FROM day2.student;

SET FOREIGN_KEY_CHECKS = 0; -- 临时取消关联
SET FOREIGN_KEY_CHECKS = 1; -- 启动关联

ALTER TABLE day2.student
  RENAME day2.new_student;

SHOW TABLES;

ALTER TABLE day2.new_student
  RENAME day2.student;

ALTER TABLE day2.student
  ADD COLUMN address VARCHAR(255)
  AFTER gender;

ALTER TABLE day2.student
  DROP COLUMN address;

ALTER TABLE day2.student
  DROP COLUMN city;

ALTER TABLE day2.student
  MODIFY COLUMN name VARCHAR(20);

DESC day2.student;

ALTER TABLE day2.student
  MODIFY COLUMN name VARCHAR(20) AFTER age;

ALTER TABLE day2.student
  ADD CONSTRAINT pk_student_id PRIMARY KEY (id);

ALTER TABLE day2.student
  MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE day2.student
  CHANGE gender sex VARCHAR(255);
-- **** 重要
ALTER TABLE day2.student
  ADD CONSTRAINT
  fk_student_departmentId -- alias 别名
FOREIGN KEY (departmentId)
REFERENCES day2.department (id);

ALTER TABLE day2.student
  DROP FOREIGN KEY fk_student_departmentId;
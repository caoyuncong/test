DROP DATABASE IF EXISTS db_csdn;

CREATE DATABASE db_csdn;

DROP TABLE IF EXISTS db_csdn.user_new;

CREATE TABLE db_csdn.user_new (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  username VARCHAR(255)
  COMMENT '用户名',
  password VARCHAR(255)
  COMMENT '密码',
  email    VARCHAR(255)
  COMMENT '邮箱'
)
  COMMENT '用户表';

LOAD DATA LOCAL INFILE 'e:/CSDN-6million/www.csdn.net.sql'
INTO TABLE db_csdn.user_new
FIELDS TERMINATED BY ' # ' (username, password, email)
SET id = NULL;

TRUNCATE TABLE db_csdn.user_new;

SELECT *
FROM db_csdn.user_new;

SELECT count(*)
FROM db_csdn.user_new;

SHOW TABLE STATUS FROM db_csdn;

-- 处理错误数据
SELECT *
FROM db_csdn.user_new
WHERE user_new.email IS NULL;

SELECT *
FROM db_csdn.user_new
WHERE user_new.email LIKE ' # %';

UPDATE db_csdn.user_new
SET email = substr(password, instr(password, ' # '))
WHERE email IS NULL;

UPDATE db_csdn.user_new
SET password = replace(password, email, '')
WHERE user_new.email LIKE ' # %';

UPDATE db_csdn.user_new
SET email = substr(email, 3 + 1)
WHERE email LIKE ' # %';

SELECT substr(password,instr(password,' # '))
FROM db_csdn.user_new
WHERE id = 31521;




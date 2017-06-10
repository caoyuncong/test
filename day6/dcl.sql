-- DCL DBA Database Administrator

DROP DATABASE IF EXISTS db_dcl;

CREATE DATABASE db_dcl; -- 先创建数据库

SHOW DATABASES ;

SELECT *
FROM mysql.user;

DROP USER dcl_user@'localhost';

CREATE USER dcl_user@'localhost' -- 然后创建User ,以User的dcl_user身份操纵数据库
  IDENTIFIED BY 'system';

GRANT ALL ON db_dcl.* TO dcl_user@'localhost';
-- 对这句代码的中文意思：对dcl_user身份在db_dcl数据库上授予所有的权限
-- 授予dcl_user 对这个db_dcl数据库的所有表操作的权限

REVOKE CREATE ON db_dcl.* FROM dcl_user@'localhost';
-- 撤销 创建数据库databases，表 tables, or索引 indexes的权限

FLUSH PRIVILEGES; -- 授予权限或撤销权限，都刷新特权（权限）

-- ===================================
SHOW GRANTS FOR dcl_user; -- grant vt.\ 授予；允许；承认

DROP DATABASE IF EXISTS db_ip;

CREATE DATABASE db_ip;

DROP TABLE IF EXISTS db_ip.ip;

CREATE TABLE db_ip.ip (
  min VARCHAR(255) NOT NULL
  COMMENT '起始IP',
  max VARCHAR(255) NOT NULL
  COMMENT '终止IP',
  geo VARCHAR(255) NOT NULL
  COMMENT '地理位置'
)
  COMMENT 'IP 表';

DESC db_ip.ip;

SELECT count(*)
FROM db_ip.ip;

SELECT *
FROM db_ip.ip;

SET AUTOCOMMIT =0;

SHOW VARIABLES LIKE '%autocommit%'; -- 查看权限

LOAD DATA LOCAL INFILE 'e:/IP.txt'
INTO TABLE db_ip.ip
FIELDS TERMINATED BY '|';

SELECT *
FROM db_ip.ip
WHERE inet_aton('59.66.101.202') BETWEEN inet_aton(min) AND inet_aton(max);

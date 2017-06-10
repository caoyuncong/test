DROP DATABASE IF EXISTS db_message;
CREATE DATABASE db_message;

DROP TABLE IF EXISTS db_message.user;
CREATE TABLE db_message.user (
  id       INT                   AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(255) UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '用户名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  role     VARCHAR(255) NOT NULL DEFAULT '普通用户'
  COMMENT '角色：普通用户，管理员'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_message.message;
CREATE TABLE db_message.message (
  id      INT               AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  content TEXT     NOT NULL
  COMMENT '留言内容',
  time    DATETIME NOT NULL DEFAULT now()
  COMMENT '留言时间',
  userId  INT COMMENT 'FK'
)COMMENT '留言表';

-- fk
ALTER TABLE db_message.message
  ADD CONSTRAINT
  fk_message_userId
FOREIGN KEY (userId)
REFERENCES db_message.user (id);


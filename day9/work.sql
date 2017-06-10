DROP DATABASE IF EXISTS db_journal;
CREATE DATABASE db_journal;

DROP TABLE IF EXISTS db_journal.team;
CREATE TABLE db_journal.team (
  id    INT PRIMARY KEY       AUTO_INCREMENT
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
);
DROP TABLE IF EXISTS db_journal.user;
CREATE TABLE db_journal.user (
  id       INT PRIMARY KEY       AUTO_INCREMENT
  COMMENT 'PK',
  username VARCHAR(255) NOT NULL UNIQUE
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  team     VARCHAR(255) NOT NULL
  COMMENT '组别',
  type     VARCHAR(255) NOT NULL
  COMMENT '类型：员工，组长'
)
  COMMENT '用户注册表';

DROP TABLE IF EXISTS db_journal.message;
CREATE TABLE db_journal.message (
  id      INT PRIMARY KEY       AUTO_INCREMENT
  COMMENT 'PK',
  content TEXT     NOT NULL
  COMMENT '留言内容',
  time    DATE NOT NULL     DEFAULT current_date()
  COMMENT '留言时间',
  userId  INT COMMENT 'FK'
)
  COMMENT '留言表';

-- fk

ALTER TABLE db_journal.message
  ADD CONSTRAINT
  fk_message_userId
FOREIGN KEY (userId)
REFERENCES db_journal.user (id);

-- 用户注册

INSERT INTO db_journal.user (username, password, team) VALUE ('staff1', '123', '第一组');
INSERT INTO db_journal.user (username, password, team) VALUE ('staff2', '123', '第二组');
INSERT INTO db_journal.user (username, password, team) VALUE ('staff3', '123', '第三组');

-- 用户留言

INSERT INTO db_journal.message (content, userId) VALUE ('留言内容1.。。', 1);
INSERT INTO db_journal.message (content, userId) VALUE ('留言内容2.。。', 1);
INSERT INTO db_journal.message (content, userId) VALUE ('留言内容3.。。', 2);
INSERT INTO db_journal.message (content, userId) VALUE ('留言内容4.。。', 2);

-- 添加管理员
INSERT INTO db_journal.user VALUES (NULL, 'groupLeader', '123', '第一组', '组长');

-- 查看日志
SELECT
  u.username,
  m.userId,
  m.content,
  m.time
FROM db_journal.user u
  INNER JOIN db_journal.message m
    ON u.id = m.userId;

-- 组长按姓名、日期查询
SELECT
  u.username,
  m.time
FROM db_journal.message m
  INNER JOIN db_journal.user u
    ON u.id = m.userId;
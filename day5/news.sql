DROP DATABASE IF EXISTS db_news;
CREATE DATABASE db_news;

-- table news
DROP TABLE IF EXISTS db_news.news;
CREATE TABLE db_news.news (
  id      INT PRIMARY KEY AUTO_INCREMENT
  COMMENT 'PK',
  content MEDIUMTEXT NOT NULL
  COMMENT '内容'
)
  COMMENT '新闻表';

-- table comment
DROP TABLE IF EXISTS db_news.comment;
CREATE TABLE db_news.comment (
  id        INT PRIMARY KEY AUTO_INCREMENT
  COMMENT 'PK',
  content   TEXT NOT NULL
  COMMENT '内容',
  newsId    INT COMMENT 'FK',
  commentId INT COMMENT 'FK'
)
  COMMENT '评论表';

-- FK
ALTER TABLE db_news.comment
    ADD CONSTRAINT
fk_comment_newsId
FOREIGN KEY (newsId)


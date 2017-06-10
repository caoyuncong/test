DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.word;
CREATE TABLE db_dict.word (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  english VARCHAR(255)
  COMMENT '英文',
  chinese VARCHAR(255)
  COMMENT '中文'
)
  COMMENT '词典表';


INSERT INTO db_dict.word VALUE (NULL, 'apple', '苹果');
INSERT INTO db_dict.word VALUES (NULL, 'banana', '香蕉');

SELECT chinese
FROM db_dict.word
WHERE english = 'apple';

SELECT english
FROM db_dict.word
WHERE chinese = '香蕉';

SELECT *
FROM db_dict.word
WHERE english = 'apple' OR chinese = 'apple';
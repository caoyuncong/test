SELECT *
FROM mysql.user;

SELECT 1 + 1; # comment...
SELECT 1 + 1; -- comment...
SELECT 1 + /*comment*/+1;
SELECT 1 +
       /*a
       b
       c*/1;

DROP DATABASE test;
CREATE DATABASE test;
USE test;
SHOW TABLES;
CREATE TABLE test.user (
  id   INT,
  name VARCHAR(255)
);
SELECT *
FROM test.user;

INSERT INTO test.user VALUES (1, 'zhangsan');

UPDATE test.user
SET name = 'lisi'
WHERE id = 1;

DELETE FROM test.user
WHERE id = 1;
SELECT *
FROM scott.emp; -- DQL  还包括  show

-- DML insert update delete   不开启事务，自动提交，回滚，找不回数据

-- DTL Transaction
START TRANSACTION; -- 事务

DELETE FROM scott.emp;

INSERT INTO scott.emp (EMPNO) VALUES (1);

UPDATE scott.emp
SET ENAME = 'zhangsan'
WHERE EMPNO = 1;

UPDATE scott.emp
SET ENAME = 'new_scott'
WHERE ENAME = 'scott';

UPDATE scott.emp
SET SAL = SAL * 1.2;

UPDATE scott.emp
SET ENAME = 'scott'
WHERE ENAME = 'new_scott';

UPDATE scott.emp
SET SAL = SAL / 1.2;

CREATE TABLE scott.temp (
  id INT
); -- DDL create drop alter 结束一次事务 commit 隐式结束


ROLLBACK; -- 回滚 结束一次事务 显式结束
COMMIT; -- 提交  结束一次事务 显式结束

SELECT *
FROM scott.emp;

START TRANSACTION;

DELETE FROM scott.emp;

TRUNCATE TABLE scott.emp; -- 截断  与事务无关
ROLLBACK;
-- ================================================
SELECT *
FROM scott.emp;

START TRANSACTION;

INSERT INTO scott.emp (EMPNO) VALUES (5);

SAVEPOINT a; -- 保留点

UPDATE scott.emp
SET ENAME = 'B'
WHERE EMPNO = 5;

SAVEPOINT b;

DELETE FROM scott.emp;

ROLLBACK TO a;

SELECT *
FROM scott.emp;

SET AUTOCOMMIT =0; --  自动提交起作用

SET AUTOCOMMIT =1; -- 自动提交不起作用

ROLLBACK ;
-- ====================================================
/*
Zhangsan             Lisi
1500                 0
500                  1000
一次事务
DML insert update delete
1. update db set money = money - 1000 where id = 12345;
2. update db set money = money + 1000 where id = 67890;
A:
1. right
2. wrong
B:
1. wrong
2. right
C: 全部完成 commit
1. right
2. right
D: 全部不完成 rollback
1. wrong
2. wrong
 */
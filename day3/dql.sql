-- show
SHOW DATABASES;
USE db_student;
SHOW TABLES;
SHOW TABLE STATUS FROM db_student;
SHOW FULL COLUMNS FROM db_student.student;
SHOW VARIABLES LIKE 'ch%';
SHOW VARIABLES LIKE 'col%';

SHOW CREATE TABLE db_student.student;

SELECT *
FROM db_student.student;

SELECT
  name,
  gender,
  dob
FROM db_student.student;

SELECT *
FROM db_student.student
WHERE id = 1;

SELECT
  name,
  dob
FROM db_student.student
WHERE id = 2;

SELECT DISTINCT gender -- 种类不同
FROM db_student.student;

UPDATE db_student.student
SET gender = 'Female'
WHERE id = 2;

SELECT *
FROM db_student.student
WHERE age = 18 AND gender = 'Male';

SELECT *
FROM db_student.student
WHERE age = 18 OR gender = 'Male';

-- =========================
-- scott
SHOW TABLE STATUS FROM scott;
DESC scott.emp;

SELECT *
FROM scott.emp;

SELECT *
FROM scott.dept;

SELECT *
FROM scott.salgrade;

SELECT
  ENAME,
  JOB,
  HIREDATE
FROM scott.emp
WHERE ENAME = 'scott';

SELECT DISTINCT JOB
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE HIREDATE = '1987-7-13';

SELECT *
FROM scott.emp
WHERE JOB = 'salesman' AND DEPTNO = 20;

SELECT
  ENAME,
  JOB,
  COMM
FROM scott.emp
ORDER BY 3 DESC; -- asc ascend vi.\ 上升；登高；追溯 desc vi.\ 下降；下去；下来；遗传；屈尊

SELECT
  ENAME,
  JOB,
  COMM
FROM scott.emp
ORDER BY HIREDATE DESC; -- null 是最小值

SELECT
  ENAME,
  JOB,
  COMM
FROM scott.emp
ORDER BY DEPTNO DESC, ENAME;

SELECT *
FROM scott.emp
LIMIT 3 OFFSET 3; -- offSet 偏移量    limit 限制    分页查询

SELECT *
FROM scott.emp
LIMIT 0, 3;    -- 0 代表偏移量  3  代表 limit的值

DESC db_student.student;

SELECT *
FROM db_student.student;
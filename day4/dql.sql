SELECT *
FROM scott.emp
WHERE ENAME LIKE '%a%a%'; -- 通配符  任意数量任意字符

SELECT *
FROM scott.emp
WHERE ENAME LIKE '_a%'; -- 下划线  数量为1的任意字符

SELECT *
FROM scott.emp
WHERE HIREDATE LIKE '%81%';

UPDATE scott.emp
SET ENAME = 'S_COTT'
WHERE ENAME = 'scott';

SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE ENAME LIKE '%\_%' ESCAPE '\\';

CREATE TABLE scott.emp_new LIKE scott.emp;

SHOW TABLE STATUS FROM scott;

DESC scott.emp;
DESC scott.emp_new;

SHOW CREATE TABLE scott.emp_new;

-- ========================================= 正则表达式  REGEXP regular expression
SELECT *
FROM scott.emp
WHERE ENAME REGEXP 'a'; -- RLIKE REGEXP 正则匹配

SELECT *
FROM scott.emp
WHERE ENAME = BINARY 'WARd';

SELECT *
FROM scott.emp
WHERE ENAME REGEXP 'a|b';

SELECT *
FROM scott.emp
WHERE ENAME LIKE '%a%' OR emp.ENAME LIKE '%b%';

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[a-z]';

UPDATE scott.emp
SET ENAME = '斯科特'
WHERE EMPNO = 7788;

SELECT *
FROM scott.emp
WHERE ENAME NOT REGEXP '[\u4e00-u9fbb]'; -- ?

SELECT *
FROM scott.emp
WHERE ENAME RLIKE '\\.';

UPDATE scott.emp
SET ENAME = '斯科特.'
WHERE ENAME = '斯科特';

SELECT *
FROM scott.emp
WHERE COMM REGEXP '[0-9]{3}';

SELECT *
FROM scott.emp
WHERE COMM > 99 AND COMM < 1000;

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '^a';

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[^a-z]';

SELECT 'hello0' REGEXP '[0-9]';

SELECT *
FROM scott.emp
WHERE ENAME NOT LIKE '%a%';


SELECT *
FROM scott.emp
WHERE JOB NOT IN ('manager', 'clerk');

SELECT *
FROM scott.emp
WHERE JOB = 'manager' OR JOB = 'clerk';

SELECT *
FROM scott.emp
WHERE SAL BETWEEN 1200 AND 1600; -- between  and  的取值范围 [number1,number2]

-- alias
SELECT
  ENAME       '姓名',
  JOB      AS '工作',
  HIREDATE AS '入职时间'
FROM scott.emp;

SELECT
  e.ENAME,
  e.JOB,
  e.HIREDATE,
  e.DEPTNO
FROM scott.emp AS e;

SELECT *
FROM scott.emp
WHERE COMM IS NOT NULL; -- -- NULL 的判断：is null, is not null

UPDATE scott.emp
SET COMM = NULL
WHERE EMPNO = 7844;

SELECT *
FROM scott.emp;
SELECT
  ENAME,
  SAL + ifnull(COMM, 0)
FROM scott.emp;

-- ========================= JOIN
SELECT
  ENAME,
  DNAME
FROM scott.emp, scott.dept; -- 13*4=52
-- cross join 交叉连接 笛卡尔积

SELECT
  ENAME,
  DNAME
FROM scott.dept
  INNER JOIN scott.emp; -- 13*4

SELECT
  ENAME,
  DNAME
FROM scott.emp
  CROSS JOIN scott.dept; -- 13*4

-- inner join 内连接
SELECT
  ENAME,
  DNAME
FROM scott.dept
  INNER JOIN scott.emp
    ON dept.DEPTNO = emp.DEPTNO; -- 连接条件
-- 内连接中的inner 不能换成 cross ,cross 只有上面一种情况

-- 左外连接 from 后面的表是左表，left outer join 后是右表，
-- 左外连接查找左表遗漏的连接条件不成立
SELECT
  ENAME,
  DNAME
FROM scott.dept
  LEFT OUTER JOIN scott.emp
    ON dept.DEPTNO = emp.DEPTNO; -- 连接条件
-- 右外连接查找右表遗漏的连接条件不成立
SELECT
  ENAME,
  DNAME
FROM scott.dept
  RIGHT OUTER JOIN scott.emp
    ON dept.DEPTNO = emp.DEPTNO; -- 连接条件

UPDATE scott.emp
SET ENAME = 'SCOTT'
WHERE EMPNO='7788';

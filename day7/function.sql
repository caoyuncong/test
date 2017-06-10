SELECT
  max(SAL),
  min(SAL),
  avg(SAL),
  -- average
  sum(SAL),
  count(*)
FROM scott.emp;

SELECT count(*) -- 统计行数
FROM scott.emp;

SELECT max(HIREDATE)
FROM scott.emp;

SELECT avg(HIREDATE)
FROM scott.emp;

SELECT sum(HIREDATE) / count(HIREDATE)
FROM scott.emp;

SELECT *
FROM scott.emp  -- 相当于其他数据库的first()
LIMIT 0, 1;

SELECT *
FROM scott.emp
GROUP BY EMPNO DESC  -- 相当于其他数据库的last()
LIMIT 0, 1;

SELECT *
FROM scott.emp;

SELECT
  DEPTNO,
  avg(SAL),
  count(*),
  max(HIREDATE),
  min(ENAME),
  -- 在字符串类型中，min() 和  max() 按字母排序
  sum(COMM)
FROM scott.emp
GROUP BY DEPTNO -- 分组查询  把 column_name 列值相同的分为一组
HAVING count(*) > 5; -- 组检索

SELECT *
FROM scott.emp
WHERE SAL > 3000; -- 行检索

SELECT
  JOB,
  DEPTNO,
  count(*)
FROM scott.emp
GROUP BY DEPTNO, JOB;

SELECT
  JOB,
  DEPTNO,
  count(*)
FROM scott.emp
GROUP BY JOB, DEPTNO;

SELECT
  DEPTNO,
  count(*),
  group_concat(DISTINCT ENAME ORDER BY ENAME DESC SEPARATOR '|')
FROM scott.emp
GROUP BY DEPTNO;

SELECT abs(-100);

SELECT hex(SAL)
FROM scott.emp;
# hex：可以用HEX()函数将一个字符串或数字转换为十六进制格式的字符串
# unhex：把十六进制格式的字符串转化为原来的格式

SELECT round(pi(), 3); -- 四舍五入

SELECT ascii('a'); -- a 的ascii  97

SELECT bit_length('abc'); -- 返回字符串的比特长度  一个英文字母

SELECT concat(ENAME, JOB, MGR)
FROM scott.emp; --   CONCAT(s1,s2...,sn) 将 s1,s2...,sn 连接成字符串

SELECT concat_ws(' ', ENAME, JOB, MGR)
FROM scott.emp; --   CONCAT(s1,s2...,sn) 将 s1,s2...,sn 连接成字符串
-- 并用 sep 字符间隔

SELECT length('hello'); --  返回字符串 str 中的字符数
SELECT length('中文'); -- byte     utf-8 一个中文=3个字节
SELECT char_length('中文');
SELECT char_length('mkl');

SELECT *
FROM scott.emp
WHERE length(ENAME) != char_length(ENAME);

SELECT ltrim('    a'); -- 去除字符串首部（left）的所有空格

SELECT trim('      a      '); -- 去除字符串首部和尾部的所有空格

SELECT rtrim('a         '); -- 去除字符串尾部(right)的所有空格

SELECT upper('a'); -- a->A
SELECT ucase('a'); -- a->A

SELECT lower('A'); -- A->a
SELECT lcase('A'); -- A->a

SELECT
  curdate(),
  current_date; -- 返回当前的日期
SELECT
  current_time,
  curtime(); -- 返回当前的时间

SELECT now(); -- 返回当前的日期和时间

SELECT date_add(HIREDATE, INTERVAL 12 MONTH)
FROM scott.emp; -- 返回日期 date 加上间隔时间 int 的结果

SELECT dayofweek('2017-1-15'); -- 返回 date 所代表的一星期中的第几天(1~7)

SELECT dayofyear('2017-1-15'); -- 返回 date 是一年的第几天(1~366)

SELECT
  HIREDATE,
  date_format(HIREDATE, '%Y-%M')
FROM scott.emp; -- 依照指定的 fmt 格式格式化日期 date 值









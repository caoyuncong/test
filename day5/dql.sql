--  并集  UNION
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  LEFT OUTER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO

UNION

SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  RIGHT JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

-- ====================================================

CREATE TABLE scott.new_emp
  SELECT *
  FROM scott.emp; -- DDL

DESC scott.new_emp; -- 没主键，外键,但有数据

SELECT *
FROM scott.new_emp;
-- ===============

INSERT INTO scott.new_emp
  SELECT *
  FROM scott.emp; -- 在new_emp表，插入数据，不是emp表

DELETE FROM scott.new_emp;

-- =================================
CREATE TABLE scott.temp_emp LIKE scott.emp; -- 有主键，外键，但无数据

DESC scott.temp_emp;

SELECT *
FROM scott.temp_emp;

-- ===============
INSERT INTO scott.temp_emp
  SELECT *
  FROM scott.emp; -- 在temp_temp表，插入数据，

DELETE FROM scott.temp_emp;

-- ==================================
INSERT INTO db_student.student
  SELECT *
  FROM db_student.student;

SELECT *
FROM db_student.student;

INSERT INTO db_student.student (name, age, gender, dob, departmentId)
  SELECT
    name,
    age,
    gender,
    dob,
    departmentId
  FROM db_student.student;

-- =============================================================== ？？？？？

INSERT INTO scott.new_emp (EMPNO, DEPTNO) VALUES (1, 1); -- 没主键，外键约束，
INSERT INTO scott.emp (EMPNO, DEPTNO) VALUES (1, 1);
INSERT INTO scott.temp_emp (EMPNO, DEPTNO) VALUES (1, 1);

DELETE FROM scott.emp
WHERE EMPNO = 1;

DESC scott.new_emp;

SELECT *
FROM scott.emp;

INSERT INTO scott.dept (DEPTNO) VALUES (1);

-- ================================================
-- 视图创建  优点  1. 安全  2. 优化查询  3. 逻辑独立性
-- 视图里边没有数据，简单视图可以进行增（主键必须有值）删查改
CREATE VIEW scott.v_emp
AS
  SELECT
    ENAME,
    JOB,
    HIREDATE,
    SAL
  FROM scott.emp
  WHERE HIREDATE > '1985-12-31';

SHOW TABLE STATUS FROM scott;

SELECT *
FROM scott.v_emp
WHERE ENAME RLIKE 'a';

UPDATE scott.v_emp
    SET SAL=SAL*0.2;

DELETE FROM scott.v_emp;

-- =============================================
SHOW CREATE VIEW scott.v_emp;

SHOW FULL TABLES FROM scott;

SHOW FULL TABLES FROM scott WHERE table-type='view';

SHOW TABLE STATUS FROM scott;
-- ======================================================

INSERT INTO scott.v_emp VALUES ('lisi', 'job...', '1987-3-4', 200);

-- ==============
CREATE VIEW db_student.v_student_credits
AS
  SELECT
    s.name,
    sum(c.credit)
  FROM db_student.student s LEFT JOIN db_student.student_course sc
      ON s.id = sc.studentId
    LEFT JOIN db_student.course c
      ON sc.courseId = c.id
  WHERE sc.grade >= 60
  GROUP BY s.id;

DESC db_student.student_course;

SELECT *
FROM db_student.v_student_credits;

SELECT *
FROM db_student.v_student_credits
WHERE name = 'lisi';

INSERT INTO db_student.student_course (grade) VALUES (60);

SELECT *
FROM db_student.student_course;




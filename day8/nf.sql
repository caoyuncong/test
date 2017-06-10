DROP DATABASE IF EXISTS db_nf;
CREATE DATABASE db_nf;

-- student table
CREATE TABLE db_nf.student (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  info   VARCHAR(255) NOT NULL
  COMMENT '学生信息',
  gender VARCHAR(255)
);

INSERT INTO db_nf.student VALUES (NULL, 'info...', '男');
INSERT INTO db_nf.student VALUES (NULL, 'info2...', '男 女');

SELECT *
FROM db_nf.student;

DESC db_student.student_course;

DROP TABLE IF EXISTS db_student.new_sc;

CREATE TABLE db_student.new_sc (
  studentId INT,
  courseId  INT,
  grade     INT,
  CONSTRAINT pk_new_sc_studentId_courseId PRIMARY KEY (studentId, courseId)
);

DESC db_student.new_sc;

INSERT INTO db_student.new_sc VALUES (1, 1, NULL);
INSERT INTO db_student.new_sc VALUES (1, 2, 60);
INSERT INTO db_student.new_sc VALUES (2, 1, 70);
INSERT INTO db_student.new_sc VALUES (3, 3, NULL);
INSERT INTO db_student.new_sc VALUES (1, 3, NULL);

SELECT *
FROM db_student.new_sc;

UPDATE db_student.new_sc
SET grade = 80
WHERE studentId = 2 AND courseId = 3;




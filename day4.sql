CREATE DATABASE ubs_training;
USE ubs_training;
CREATE USER 'ubs_intern'@'localhost' IDENTIFIED BY 'noora2032000#';
GRANT ALL PRIVILEGES ON ubs_training.* TO 'ubs_intern'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE enrollments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade DECIMAL(5,2),
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

SHOW TABLES;

DESCRIBE students;

DESCRIBE courses;

DESCRIBE enrollments;

INSERT INTO students (name, email)
VALUES
('Ahmad Ali', 'ahmad@gmail.com'),
('Sara Omar', 'sara@gmail.com'),
('Mohammad Saleh', 'mohammad@gmail.com'),
('Lina Khaled', 'lina@gmail.com'),
('Yousef Hasan', 'yousef@gmail.com');

INSERT INTO courses (title, code)
VALUES
('Database Systems', 'DB101'),
('Java Programming', 'JAVA201'),
('Web Development', 'WEB301');

SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO enrollments (student_id, course_id, grade)
VALUES
(1,1,85),(1,2,90),
(2,2,78),(2,3,82),
(3,1,88),(3,3,75),
(4,1,91),(4,2,80),
(5,2,73),(5,3,95);

SELECT * FROM enrollments;

SELECT * FROM students;

SELECT * FROM courses;

SELECT
    students.name,
    courses.title,
    enrollments.grade,
    enrollments.enrolled_at
FROM enrollments
INNER JOIN students
ON enrollments.student_id = students.id
INNER JOIN courses
ON enrollments.course_id = courses.id;

INSERT INTO students (name, email)
VALUES ('Omar Ahmad', 'omar@gmail.com');

SELECT
    students.id,
    students.name,
    students.email
FROM students
LEFT JOIN enrollments
ON students.id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

SELECT
    courses.title,
    AVG(enrollments.grade) AS average_grade
FROM enrollments
INNER JOIN courses
ON enrollments.course_id = courses.id
GROUP BY courses.title;

SELECT
    students.name,
    AVG(enrollments.grade) AS average_grade
FROM students
INNER JOIN enrollments
ON students.id = enrollments.student_id
GROUP BY students.id, students.name
HAVING AVG(enrollments.grade) > 75;

UPDATE enrollments
SET grade = 95
WHERE id = 1;

SELECT * 
FROM enrollments
WHERE id = 1;

DELETE FROM enrollments
WHERE id = 1;

SELECT * 
FROM enrollments;

SELECT *
FROM students
WHERE id = 1;

SELECT *
FROM courses
WHERE id = 1;

EXPLAIN
SELECT *
FROM enrollments
WHERE student_id = 3;

CREATE INDEX idx_student_id
ON enrollments(student_id);

EXPLAIN
SELECT *
FROM enrollments
WHERE student_id = 3;

SHOW INDEX FROM enrollments;



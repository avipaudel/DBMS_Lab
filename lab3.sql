CREATE DATABASE lab3;

use lab3;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credit_hour INT
);

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert Data into Students
INSERT INTO Students (student_id, name, age, email, phone_number) VALUES
(1, 'Alice Smith', 20, 'alice@example.com', '555-0101'),
(2, 'Bob Johnson', 22, 'bob@example.com', '555-0102'),
(3, 'Charlie Brown', 19, 'charlie@example.com', '555-0103'),
(4, 'Diana Prince', 21, 'diana@example.com', '555-0104'),
(5, 'Evan Wright', 23, 'evan@example.com', '555-0105');

INSERT INTO courses (course_id, name, credit_hour) VALUES
(101, 'Introduction to Computer Science', 3),
(102, 'Data Structures', 4),
(103, 'Database Management Systems', 3),
(104, 'Web Development', 3),
(105, 'Artificial Intelligence', 4);

INSERT INTO enrollment (enrollment_id, course_id, student_id) VALUES
(1001, 101, 1),
(1002, 103, 1),
(1003, 102, 2),
(1004, 104, 2),
(1005, 101, 3),
(1006, 105, 4),
(1007, 103, 5),
(1008, 105, 5),
(1009, 102, 1);


--8. Count student
SELECT COUNT(*) from Students


-- 9.Average age
SELECT AVG(age) from Students

-- 10.max credit hour for any course
SELECT name ,MAX(credit_hour) from courses
GROUP BY name
LIMIT 1;

-- 11.age of youngest sudent
SELECT name ,MAX(age) from Students
GROUP BY name,age
ORDER BY age ASC
LIMIT 1;


-- 12.sum of credit hour
SELECT SUM(credit_hour) from courses;


-- 13.no. of student in each course
SELECT student_id , COUNT(enrollment_id) from enrollment
GROUP BY student_id;

-- 15.counting course_id where more than 1 student enrolled
SELECT course_id  from enrollment
GROUP BY course_id
HAVING COUNT(course_id)>=2;


-- 16 .Find the student_ids of students who are enrolled in exactly 2 courses.
SELECT student_id  from enrollment
GROUP BY student_id
HAVING COUNT(student_id)=2;

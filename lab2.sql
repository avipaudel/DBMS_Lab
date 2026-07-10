
CREATE DATABASE lab2;
use lab2;-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credit_hour INT
);

-- Create Enrollment Table
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

-- Insert Data into Courses
INSERT INTO courses (course_id, name, credit_hour) VALUES
(101, 'Introduction to Computer Science', 3),
(102, 'Data Structures', 4),
(103, 'Database Management Systems', 3),
(104, 'Web Development', 3),
(105, 'Artificial Intelligence', 4);

-- Insert Data into Enrollment
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


-- Retrieve all records and columns from the Students table.
SELECT * FROM lab2.students;


-- List only the name and email of all students.
SELECT name,email FROM lab2.students;

-- Find all students who are strictly older than 20 years.
SELECT * FROM Students
WHERE age>20


-- Retrieve the names of students whose name starts with the letter 'A' (Use the LIKE operator).
SELECT * FROM lab2.students
WHERE name LIKE 'A%';

-- Find all courses that have the word 'Science' anywhere in their name.
SELECT *
FROM courses
WHERE name LIKE '%Science%';

-- List all students sorted by their age in descending order.
SELECT *
FROM Students
ORDER BY age DESC;
-- Retrieve the details of the student with the exact phone number '555-0103'.
SELECT *
FROM Students
WHERE phone_number = '555-0103';

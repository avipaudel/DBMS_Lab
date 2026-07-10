-- Active: 1783049525912@@127.0.0.1@3306@lab3
SELECT * from lab2.Students;


-- Insert a new student into the Students table.
INSERT INTO Students (student_id, name, age, email, phone_number)
VALUES
(6, 'Frank Miller', 20, 'frank@example.com', '555-0106');


-- Update the email and phone number of student with ID 6.
UPDATE Students
SET
    email = 'frank.miller@example.com',
    phone_number = '555-0206'
WHERE student_id = 6;
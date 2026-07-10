-- Active: 1783047382107@@127.0.0.1@3306@lab2
use lab2;
-- 17.
SELECT Students.name , enrollment.course_id FROM students
join enrollment
on enrollment.student_id = students.student_id;


-- 18.
SELECT Students.name ,courses.name FROM students
join enrollment
on enrollment.student_id = students.student_id
join courses 
on  enrollment.course_id = courses.course_id;


-- 19.List all courses and the number of students enrolled in each, including courses with zero enrollments.
SELECT
    c.course_id,
    c.name AS course_name,
    COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollment e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.name
ORDER BY c.course_id;


-- 20 . Find the names of all students who are actively taking 'Database Management Systems'.
SELECT s.name
FROM Students s
JOIN enrollment e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id
WHERE c.name = 'Database Management Systems';


--21. Identify students who are not enrolled in any course.
SELECT s.student_id, s.name
FROM Students s
LEFT JOIN enrollment e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;


--22. Calculate the total credit hours each student is currently taking.
SELECT
    s.name,
    SUM(c.credit_hour) AS total_credit_hours
FROM Students s
JOIN enrollment e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id
GROUP BY s.student_id, s.name
ORDER BY s.student_id;


-- 23.Find the names of students who are enrolled in the course with the highest credit hours.
SELECT DISTINCT s.name
FROM Students s
JOIN enrollment e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id
WHERE c.credit_hour = (
    SELECT MAX(credit_hour)
    FROM courses
);


-- 24.List the courses with an enrollment count greater than the average enrollment count.
SELECT
    c.course_id,
    c.name,
    COUNT(e.student_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollment e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.name
HAVING COUNT(e.student_id) >
(
    SELECT AVG(course_count)
    FROM
    (
        SELECT COUNT(*) AS course_count
        FROM enrollment
        GROUP BY course_id
    ) AS avg_table
);


--25. Find the names of students whose age is greater than the average age of all students.
SELECT name
FROM Students
WHERE age > (
    SELECT AVG(age)
    FROM Students
);
CREATE DATABASE lab1;

use lab1

create Table student (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age int,
    Contact BIGINT
);

INSERT INTO student
VALUES 
(01,'Ram',20,9877432341),
(02,'Shyam',19,9874351284),
(03,'Gita',20,9879867584),
(04,'Sita',18,9874579084),
(05,'hari',21,9864616382);

SELECT * from student;

SELECT * FROM student WHERE age > '18';

SELECT name FROM student WHERE contact = '9864616382';
create database  studentproject ;
use studentproject;
select * from student_performance;
INSERT INTO student_performance VALUES
(1, 'Anu', 'B.Com', 'Chennai', 85, 78, 92, '2025-06-15'),
(2, 'Bala', 'B.Com', 'Trichy', 72, 81, 75, '2025-06-16'),
(3, 'Charan', 'BBA', 'Madurai', 90, 88, 94, '2025-06-17'),
(4, 'Divya', 'B.Com', 'Chennai', 65, 70, 68, '2025-06-18'),
(5, 'Ezhil', 'BCA', 'Coimbatore', 78, 84, 80, '2025-06-19'),
(6, 'Farah', 'B.Com', 'Trichy', 92, 89, 95, '2025-06-20'),
(7, 'Gokul', 'BBA', 'Salem', 55, 62, 60, '2025-06-21'),
(8, 'Hari', 'BCA', 'Chennai', 81, 76, 85, '2025-06-22'),
(9, 'Indhu', 'B.Com', 'Madurai', 88, 91, 87, '2025-06-23'),
(10, 'Jeeva', 'BBA', 'Coimbatore', 70, 73, 69, '2025-06-24'),
(11, 'Kavi', 'B.Com', 'Salem', 95, 93, 97, '2025-06-25'),
(12, 'Lokesh', 'BCA', 'Trichy', 60, 58, 65, '2025-06-26'),
(13, 'Meena', 'B.Com', 'Chennai', 83, 86, 80, '2025-06-27'),
(14, 'Naveen', 'BBA', 'Madurai', 74, 69, 77, '2025-06-28'),
(15, 'Priya', 'BCA', 'Coimbatore', 89, 92, 90, '2025-06-29'),
(16, 'Ravi', 'B.Com', 'Trichy', 68, 72, 71, '2025-06-30'),
(17, 'Sana', 'BBA', 'Chennai', 91, 87, 93, '2025-07-01'),
(18, 'Tharun', 'B.Com', 'Salem', 76, 79, 74, '2025-07-02'),
(19, 'Uma', 'BCA', 'Madurai', 84, 82, 88, '2025-07-03'),
(20, 'Vijay', 'B.Com', 'Coimbatore', 59, 64, 61, '2025-07-04');

SELECT * FROM student_performance;

USE student_project;

-- Display all records
SELECT * FROM student_performance;

-- Display student names and courses
SELECT student_name, course
FROM student_performance;

-- Display student names and marks
SELECT student_name, python_marks, sql_marks, powerbi_marks
FROM student_performance;

-- Display only the first 5 records
SELECT * FROM student_performance
LIMIT 5;

-- Students who scored more than 80 in SQL
SELECT * FROM student_performance
WHERE sql_marks > 80;

-- Students studying B.Com
SELECT * FROM student_performance
WHERE course = 'B.Com';

-- Students from Chennai
SELECT * FROM student_performance
WHERE city = 'Chennai';

-- Students who scored below 60 in Python
SELECT * FROM student_performance
WHERE python_marks < 60;

-- Students who scored above 80 in both Python and SQL
SELECT * FROM student_performance
WHERE python_marks > 80 AND sql_marks > 80;

-- Students from Chennai or Trichy
SELECT * FROM student_performance
WHERE city IN ('Chennai', 'Trichy');

-- Sort students by Python marks (highest first)
SELECT * FROM student_performance
ORDER BY python_marks DESC;

-- Sort students by SQL marks (lowest first)
SELECT * FROM student_performance
ORDER BY sql_marks ASC;

-- Sort students alphabetically
SELECT * FROM student_performance
ORDER BY student_name ASC;

-- Sort by course and then SQL marks
SELECT * FROM student_performance
ORDER BY course ASC, sql_marks DESC;

-- Total Python marks
SELECT SUM(python_marks) AS total_python_marks
FROM student_performance;

-- Average Python marks
SELECT AVG(python_marks) AS average_python_marks
FROM student_performance;

-- Total number of students
SELECT COUNT(*) AS total_students
FROM student_performance;

-- Total SQL marks
SELECT SUM(sql_marks) AS total_sql_marks
FROM student_performance;

-- Average SQL marks
SELECT AVG(sql_marks) AS average_sql_marks
FROM student_performance;

-- Total Power BI marks
SELECT SUM(powerbi_marks) AS total_powerbi_marks
FROM student_performance;

-- Average Power BI marks
SELECT AVG(powerbi_marks) AS average_powerbi_marks
FROM student_performance;

-- Count students studying B.Com
SELECT COUNT(*) AS total_bcom_students
FROM student_performance
WHERE course = 'B.Com';

-- Count students in each course
SELECT course, COUNT(*) AS total_students
FROM student_performance
GROUP BY course;

-- Calculate average SQL marks for each course
SELECT course, AVG(sql_marks) AS average_sql_marks
FROM student_performance
GROUP BY course;

-- Calculate average Python marks for each city
SELECT city, AVG(python_marks) AS average_python_marks
FROM student_performance
GROUP BY city;

-- Display courses with more than 5 students
SELECT course, COUNT(*) AS total_students
FROM student_performance
GROUP BY course
HAVING COUNT(*) > 5;

-- Display courses with an average SQL score above 80
SELECT course, AVG(sql_marks) AS average_sql_marks
FROM student_performance
GROUP BY course
HAVING AVG(sql_marks) > 80;

-- Display cities with at least 4 students
SELECT city, COUNT(*) AS total_students
FROM student_performance
GROUP BY city
HAVING COUNT(*) >= 4;

-- Calculate total marks for each course
SELECT course,
       SUM(python_marks + sql_marks + powerbi_marks) AS total_marks
FROM student_performance
GROUP BY course;

-- 1. Total number of students
SELECT COUNT(*) AS total_students
FROM student_performance;

-- 2. Average marks across all three subjects
SELECT AVG((python_marks + sql_marks + powerbi_marks) / 3.0)
       AS overall_average
FROM student_performance;

-- 3. Find the top 5 students by average marks
SELECT student_name,
       ROUND((python_marks + sql_marks + powerbi_marks) / 3.0, 2)
       AS average_marks
FROM student_performance
ORDER BY average_marks DESC
LIMIT 5;

-- 4. Compare average SQL marks by course
SELECT course, ROUND(AVG(sql_marks), 2) AS average_sql_marks
FROM student_performance
GROUP BY course
ORDER BY average_sql_marks DESC;

-- 5. Count students who scored at least 80 in all subjects
SELECT COUNT(*) AS high_performers
FROM student_performance
WHERE python_marks >= 80
  AND sql_marks >= 80
  AND powerbi_marks >= 80;
  
  # 1. create two tables for join 
  USE student_project;

CREATE TABLE course_details (
    course VARCHAR(20) PRIMARY KEY,
    course_duration INT,
    department VARCHAR(50)
);

INSERT INTO course_details VALUES
('B.Com', 3, 'Commerce'),
('BBA', 3, 'Business Administration'),
('BCA', 3, 'Computer Applications');

show tables;
# INNER JOIN 
SELECT
    s.student_id,
    s.student_name,
    s.course,
    c.department,
    c.course_duration
FROM student_performance AS s
INNER JOIN course_details AS c
    ON s.course = c.course;
    
# LEFT JOIN
SELECT
    s.student_name,
    s.course,
    c.department
FROM student_performance AS s
LEFT JOIN course_details AS c
    ON s.course = c.course;    

# RIGHT JOIN
SELECT
    s.student_name,
    s.course,
    c.department,
    c.course_duration
FROM student_performance AS s
RIGHT JOIN course_details AS c
    ON s.course = c.course;
    
# INNER JOIN STUDENT AND CITY 
 SELECT
    s.student_id,
    s.student_name,
    s.city,
    c.state
FROM student_performance AS s
INNER JOIN city_details AS c
    ON s.city = c.city;   

#JOIN WITH WHERE 
 SELECT
    s.student_name,
    s.course,
    s.sql_marks,
    c.department
FROM student_performance AS s
INNER JOIN course_details AS c
    ON s.course = c.course
WHERE s.sql_marks > 80;       

#JOIN WITH ORDER BY 
SELECT
    s.student_name,
    s.course,
    s.python_marks,
    c.department
FROM student_performance AS s
INNER JOIN course_details AS c
    ON s.course = c.course
ORDER BY s.python_marks DESC;

#JOIN WITH GROUP BY 
SELECT
    c.department,
    COUNT(s.student_id) AS total_students
FROM student_performance AS s
INNER JOIN course_details AS c
    ON s.course = c.course
GROUP BY c.department;

#JOIN WITH AVG
SELECT
    s.course,
    c.department,
    ROUND(AVG(s.sql_marks), 2) AS average_sql_marks
FROM student_performance AS s
INNER JOIN course_details AS c
    ON s.course = c.course
GROUP BY s.course, c.department;

#JOIN WITH HAVING
SELECT
    s.course,
    c.department,
    ROUND(AVG(s.sql_marks), 2) AS average_sql_marks
FROM student_performance AS s
INNER JOIN course_details AS c
    ON s.course = c.course
GROUP BY s.course, c.department
HAVING AVG(s.sql_marks) > 80;

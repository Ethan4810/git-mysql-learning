-- SHOW DATABASES; 

-- CREATE `UNIVERSITY` DATABASE --
DROP DATABASE `UNIVERSITY`;
CREATE DATABASE `UNIVERSITY`;
USE `UNIVERSITY`;

-- CREATE TABLES --
-- CREATE `department` TABLE
CREATE TABLE `department` (
    dept_name VARCHAR(20) PRIMARY KEY,
    building VARCHAR(15),
    budget NUMERIC(12 , 2 )
);
DESC `department`;

-- CREATE `instructor` TABLE
CREATE TABLE `instructor` (
    ID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    dept_name VARCHAR(20),
    salary NUMERIC(8 , 2 ),
    FOREIGN KEY (dept_name)
        REFERENCES `department` (dept_name)
);
DESC `instructor`;

-- CREATE `student` TABLE
CREATE TABLE `student` (
    ID VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    dept_name VARCHAR(20) REFERENCES `department` (dept_name),
    tot_cred NUMERIC(3 , 0 )
);
DESC `student`;

-- CREATE `course` TABLE
CREATE TABLE `course` (
    course_id VARCHAR(7) PRIMARY KEY,
    title VARCHAR(50),
    dept_name VARCHAR(20) REFERENCES `department` (dept_name),
    credits NUMERIC(2 , 0 )
);
DESC `course`;

-- CREATE `section` TABLE
CREATE TABLE `section` (
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4 , 0 ),
    building VARCHAR(8),
    room_no INT,
    time_slot_id VARCHAR(4),
    PRIMARY KEY (course_id , sec_id , semester , year),
    CHECK (semester IN ('SS' , 'FW'))
);
DESC `section`;

-- CREATE `takes` TABLE
CREATE TABLE `takes` (
    ID VARCHAR(5),
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4 , 0 ),
    grade VARCHAR(2),
    PRIMARY KEY (ID , course_id , sec_id , semester , year),
    FOREIGN KEY (ID)
        REFERENCES `student` (ID),
    FOREIGN KEY (course_id , sec_id , semester , year)
        REFERENCES `section` (course_id , sec_id , semester , year)
);
DESC `takes`;

-- CREATE `teaches` TABLE
CREATE TABLE `teaches` (
    ID VARCHAR(5),
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4 , 0 ),
    PRIMARY KEY (ID , course_id , sec_id , semester , year),
    FOREIGN KEY (ID)
        REFERENCES `instructor` (ID),
    FOREIGN KEY (course_id , sec_id , semester , year)
        REFERENCES `section` (course_id , sec_id , semester , year)
);
DESC `teaches`;

-- CREATE `prereq` TABLE
CREATE TABLE `prereq` (
    course_id VARCHAR(8),
    prereq_id VARCHAR(8),
    PRIMARY KEY (course_id , prereq_id),
    FOREIGN KEY (course_id)
        REFERENCES `course` (course_id)
);
DESC `prereq`;

-- CREATE `advisor` TABLE
-- CREATE TABLE `advisor` (
--     ID VARCHAR(5)
-- );
-- DESC `advisor`;

-- CREATE `classroom` TABLE
-- CREATE TABLE `classroom` (
--     ID VARCHAR(5)
-- );
-- DESC `classroom`;

-- CREATE `time_slot` TABLE
-- CREATE TABLE `time_slot` (
--     ID VARCHAR(5)
-- );
-- DESC `time_slot`;

-- DESC TABLE INFO
SHOW TABLES;


-- INSERTION --
-- INSERT VALUES INTO `student` TABLE
INSERT INTO `student` VALUES('00128', 'Zhang', 'Comp. Sci.', 102);
INSERT INTO `student` VALUES('12345', 'Shankar', 'Comp. Sci.', 32);
INSERT INTO `student` VALUES('19991', 'Brandt', 'History', 80);
INSERT INTO `student` VALUES('23121', 'Chavez', 'Finance', 110);
INSERT INTO `student` VALUES('44553', 'Peltier', 'Physics', 56);
INSERT INTO `student` VALUES('45678', 'Levy', 'Physics', 46);
INSERT INTO `student` VALUES('54321', 'Williams', 'Comp. Sci.', 54);
INSERT INTO `student` VALUES('55739', 'Sanchez', 'Music', 38);
INSERT INTO `student` VALUES('70557', 'Snow', 'Physics', 0);
INSERT INTO `student` VALUES('76543', 'Brown', 'Comp. Sci.', 58);
INSERT INTO `student` VALUES('76653', 'Aoi', 'Elec. Eng.', 60);
INSERT INTO `student` VALUES('98765', 'Bourikas', 'Elec. Eng.', 98);
INSERT INTO `student` VALUES('98988', 'Tanaka', 'Biology', 120);

-- INSERT VALUES INTO `course` TABLE
INSERT INTO `course` VALUES('BIO-101', 'Intro. to Bilogy', 'Biology', 4);
INSERT INTO `course` VALUES('BIO-301', 'Genetics', 'Biology', 4);
INSERT INTO `course` VALUES('BIO-399', 'Computational Biology', 'Biology', 3);
INSERT INTO `course` VALUES('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4);
INSERT INTO `course` VALUES('CS-190', 'Game Design', 'Comp. Sci.', 4);
INSERT INTO `course` VALUES('CS-315', 'Robotics', 'Comp. Sci.', 3);
INSERT INTO `course` VALUES('CS-319', 'Image Processing', 'Comp. Sci.', 3);
INSERT INTO `course` VALUES('CS-347', 'Database System Concepts', 'Comp. Sci.', 3);
INSERT INTO `course` VALUES('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3);
INSERT INTO `course` VALUES('FIN-201', 'Investment Banking', 'Finance', 3);
INSERT INTO `course` VALUES('HIS-351', 'World History', 'History', 3);
INSERT INTO `course` VALUES('MU-199', 'Music Video Production', 'Music', 3);
INSERT INTO `course` VALUES('PHY-101', 'Physical Principles', 'Physics', 4);

-- INSERT VALUES INTO `department` TABLE
INSERT INTO `department` VALUES('Biology', 'Watson', 90000);
INSERT INTO `department` VALUES('Comp. Sci.', 'Taylor', 100000);
INSERT INTO `department` VALUES('Elec. Eng.', 'Taylor', 85000);
INSERT INTO `department` VALUES('Finance', 'Painter', 120000);
INSERT INTO `department` VALUES('History', 'Painter', 50000);
INSERT INTO `department` VALUES('Music', 'Packard', 80000);
INSERT INTO `department` VALUES('Physics', 'Watson', 70000);

-- INSERT VALUES INTO `instructor` TABLE
INSERT INTO `instructor` VALUES('10101', 'Srinivasan', 'Comp. Sci.', 65000);
INSERT INTO `instructor` VALUES('12121', 'Wu', 'Finance', 90000);
INSERT INTO `instructor` VALUES('15151', 'Mozart', 'Music', 40000);
INSERT INTO `instructor` VALUES('22222', 'Einstein', 'Physics', 95000);
INSERT INTO `instructor` VALUES('32343', 'El Said', 'History', 60000);
INSERT INTO `instructor` VALUES('33456', 'Gold', 'Physics', 87000);
INSERT INTO `instructor` VALUES('45565', 'Katz', 'Comp. Sci.', 75000);
INSERT INTO `instructor` VALUES('58583', 'Califieri', 'History', 62000);
INSERT INTO `instructor` VALUES('76543', 'Singh', 'Finance', 80000);
INSERT INTO `instructor` VALUES('76766', 'Crick', 'Biology', 72000);
INSERT INTO `instructor` VALUES('83821', 'Brandt', 'Comp. Sci.', 92000);
INSERT INTO `instructor` VALUES('98345', 'Kim', 'Elec. Eng.', 80000);

-- INSERT VALUES INTO `section` TABLE
INSERT INTO `section` VALUES('BIO-101', '1', 'SS', 2009, 'Painter', 514, 'B');
INSERT INTO `section` VALUES('BIO-301', '1', 'SS', 2010, 'Painter', 514, 'A');
INSERT INTO `section` VALUES('CS-101', '1', 'FW', 2009, 'Packard', 101, 'H');
INSERT INTO `section` VALUES('CS-101', '1', 'SS', 2010, 'Packard', 101, 'F');
INSERT INTO `section` VALUES('CS-190', '1', 'SS', 2009, 'Taylor', 3128, 'E');
INSERT INTO `section` VALUES('CS-190', '2', 'SS', 2009, 'Taylor', 3128, 'A');
INSERT INTO `section` VALUES('CS-315', '1', 'SS', 2010, 'Watson', 120, 'D');
INSERT INTO `section` VALUES('CS-319', '1', 'SS', 2010, 'Watson', 100, 'B');
INSERT INTO `section` VALUES('CS-319', '2', 'SS', 2010, 'Taylor', 3128, 'C');
INSERT INTO `section` VALUES('CS-347', '1', 'FW', 2009, 'Taylor', 3128, 'A');
INSERT INTO `section` VALUES('EE-181', '1', 'SS', 2009, 'Taylor', 3128, 'C');
INSERT INTO `section` VALUES('FIN-201', '1', 'SS', 2010, 'Packard', 101, 'B');
INSERT INTO `section` VALUES('HIS-351', '1', 'SS', 2010, 'Painter', 514, 'C');
INSERT INTO `section` VALUES('MU-199', '1', 'SS', 2010, 'Packard', 101, 'D');
INSERT INTO `section` VALUES('PHY-101', '1', 'FW', 2009, 'Watson', 100, 'A');

-- INSERT VALUES INTO `takes` TABLE
INSERT INTO `takes` VALUES('00128', 'CS-101', '1', 'FW', 2009, 'A');
INSERT INTO `takes` VALUES('00128', 'CS-347', '1', 'FW', 2009, 'A-');
INSERT INTO `takes` VALUES('12345', 'CS-101', '1', 'FW', 2009, 'C');
INSERT INTO `takes` VALUES('12345', 'CS-190', '2', 'SS', 2009, 'A');
INSERT INTO `takes` VALUES('12345', 'CS-315', '1', 'SS', 2010, 'A');
INSERT INTO `takes` VALUES('12345', 'CS-347', '1', 'FW', 2009, 'A');
INSERT INTO `takes` VALUES('19991', 'HIS-351', '1', 'SS', 2010, 'B');
INSERT INTO `takes` VALUES('23121', 'FIN-201', '1', 'SS', 2010, 'C+');
INSERT INTO `takes` VALUES('44553', 'PHY-101', '1', 'FW', 2009, 'B-');
INSERT INTO `takes` VALUES('45678', 'CS-101', '1', 'FW', 2009, 'F');
INSERT INTO `takes` VALUES('45678', 'CS-101', '1', 'SS', 2010, 'B+');
INSERT INTO `takes` VALUES('45678', 'CS-319', '1', 'SS', 2010, 'B');
INSERT INTO `takes` VALUES('54321', 'CS-101', '1', 'FW', 2009, 'A-');
INSERT INTO `takes` VALUES('54321', 'CS-190', '2', 'SS', 2009, 'B+');
INSERT INTO `takes` VALUES('55739', 'MU-199', '1', 'SS', 2010, 'A-');
INSERT INTO `takes` VALUES('76543', 'CS-101', '1', 'FW', 2009, 'A');
INSERT INTO `takes` VALUES('76543', 'CS-319', '2', 'SS', 2010, 'A');
INSERT INTO `takes` VALUES('76653', 'EE-181', '1', 'SS', 2009, 'C');
INSERT INTO `takes` VALUES('98765', 'CS-101', '1', 'FW', 2009, 'C-');
INSERT INTO `takes` VALUES('98765', 'CS-315', '1', 'SS', 2010, 'B');
INSERT INTO `takes` VALUES('98988', 'BIO-101', '1', 'SS', 2009, 'A');
INSERT INTO `takes` VALUES('98988', 'BIO-301', '1', 'SS', 2010, null);

-- INSERT VALUES INTO `prereq` TABLE
INSERT INTO `prereq` VALUES('BIO-301', 'BIO-101');
INSERT INTO `prereq` VALUES('BIO-399', 'BIO-101');
INSERT INTO `prereq` VALUES('CS-190', 'CS-101');
INSERT INTO `prereq` VALUES('CS-315', 'CS-101');
INSERT INTO `prereq` VALUES('CS-319', 'CS-101');
INSERT INTO `prereq` VALUES('CS-347', 'CS-101');
INSERT INTO `prereq` VALUES('EE-181', 'PHY-101');

-- INSERT VALUES INTO `teaches` TABLE
INSERT INTO `teaches` VALUES('10101', 'CS-101', '1', 'FW', 2009);
INSERT INTO `teaches` VALUES('10101', 'CS-315', '1', 'SS', 2010);
INSERT INTO `teaches` VALUES('10101', 'CS-347', '1', 'FW', 2009);
INSERT INTO `teaches` VALUES('12121', 'FIN-201', '1', 'SS', 2010);
INSERT INTO `teaches` VALUES('15151', 'MU-199', '1', 'SS', 2010);
INSERT INTO `teaches` VALUES('22222', 'PHY-101', '1', 'FW', 2009);
INSERT INTO `teaches` VALUES('32343', 'HIS-351', '1', 'SS', 2010);
INSERT INTO `teaches` VALUES('45565', 'CS-101', '1', 'SS', 2010);
INSERT INTO `teaches` VALUES('45565', 'CS-319', '1', 'SS', 2010);
INSERT INTO `teaches` VALUES('76766', 'BIO-101', '1', 'SS', 2009);
INSERT INTO `teaches` VALUES('76766', 'BIO-301', '1', 'SS', 2010);
INSERT INTO `teaches` VALUES('83821', 'CS-190', '1', 'SS', 2009);
INSERT INTO `teaches` VALUES('83821', 'CS-190', '2', 'SS', 2009);
INSERT INTO `teaches` VALUES('83821', 'CS-319', '2', 'SS', 2010);
INSERT INTO `teaches` VALUES('98345', 'EE-181', '1', 'SS', 2009);


-- MODIFICATION --
-- DELETION --
-- Delete all instructors from the Finance department.
-- DELETE FROM `instructor`;

-- Delete all instructors associated with a department located in the Watson building.
-- DELETE FROM `instructor` 
-- WHERE
--     dept_name IN (SELECT 
--         dept_name
--     FROM
--         `department`
--     
--     WHERE
--         building = 'Watson');

-- UPDATE --
-- Increase salaries of instructors whose salary is over $100,000 by 3%.
-- UPDATE `instructor`
-- SET 
--     salary = salary * 1.03
-- WHERE
--     salary > 100000;


-- BASIC OPERATIONS --
-- SELECT CLAUSE --
-- Find all attrubutes information from students.
SELECT 
    *
FROM
    `student`;

-- Find name and department name from instructors.
SELECT 
    name, dept_name
FROM
    `instructor`;

-- Find the department names of all instructors, and remove duplicates.
SELECT DISTINCT
    dept_name
FROM
    `instructor`;

-- FROM CLAUSE --
-- Find the Cartesian product of (instructor × teaches).
SELECT 
    *
FROM
    `instructor`,
    `teaches`;

-- WHERE CLAUSE --
-- Find all instructors in Comp. Sci. department.
SELECT 
    name
FROM
    `instructor`
WHERE
    dept_name = 'Comp. Sci.';

-- Find all instructors in Comp. Sci. dept with salary > 80000.
SELECT 
    name
FROM
    `instructor`
WHERE
    dept_name = 'Comp. Sci.'
        AND salary > 80000;

-- Find the names of all instructors with the salary between $90,000 and $100,000.
SELECT 
    name
FROM
    `instructor`
WHERE
    salary BETWEEN 90000 AND 100000;

-- For all instructors who have taught some course, find their names and the course ID of the courses they taught.
SELECT 
    name, course_id
FROM
    `instructor`,
    `teaches`
WHERE
    `instructor`.ID = `teaches`.ID;

-- RENAME OPERATOINS --
-- Rename salary attribute to monthly salary.
SELECT 
    ID, name, salary / 12 AS monthly_salary
FROM
    `instructor`;
    
-- Find the names of all instructors who have a higher salary than some instructor in 'Comp. Sci.'.
SELECT DISTINCT
    T.name
FROM
    `instructor` AS T,
    `instructor` AS S
WHERE
    (T.salary > S.salary)
        AND (S.dept_name = 'Comp. Sci.');

-- STRING OPERATIONS --
-- Find the names of all instructors whose name includes the substring "an".
SELECT 
    name
FROM
    `instructor`
WHERE
    name LIKE '%an%';

-- Find the names that begin with the letter 'K'.
SELECT 
    name
FROM
    `instructor`
WHERE
    name LIKE 'K_%';

-- ORDERING OPERATIONS --
-- List the names of all instructors in an alphabetical order.
SELECT DISTINCT
    name
FROM
    `instructor`
ORDER BY name ASC;

-- List the names of all instructors in an descending alphabetical order.
SELECT DISTINCT
    name
FROM
    `instructor`
ORDER BY name DESC;

-- NULL VALUES --
-- Find all instructors whose salary is unknown.
SELECT 
    name
FROM
    `instructor`
WHERE
    salary IS NULL;

-- DATA TYPES --
-- DATE
-- TIME
-- TIMESTAMP
-- INTERVAL


-- SET OPERATIONS --
-- Find courses that ran in FW 2009 or in SS 2010.
(SELECT 
    course_id
FROM
    `section`
WHERE
    semester = 'FW' AND year = 2009) UNION (SELECT 
    course_id
FROM
    `section`
WHERE
    semester = 'SS' AND year = 2010);


-- JOIN EXPRESSIONS --
--
SELECT 
    *
FROM
    `student`,
    `takes`
WHERE
    `student`.ID = `takes`.ID;

-- INNER JOIN --
-- 
SELECT 
    *
FROM
    `student`
        JOIN
    `takes` ON `student`.ID = `takes`.ID;

-- NATURAL JOIN --
--
SELECT 
    *
FROM
    `student`
        NATURAL JOIN
    `takes`;

--
SELECT 
    *
FROM
    `instructor`
        NATURAL JOIN
    `teaches`;

-- List the names of instructors along with the course ID of the courses that they taught.
SELECT 
    name, course_id
FROM
    `instructor`
        NATURAL JOIN
    `teaches`;


-- AGGREGATE FUNCTIONS --
-- SUM CLAUSE --
-- Find the total salary of instructors in the Comp. Sci. department.
SELECT 
    SUM(salary)
FROM
    `instructor`
WHERE
    dept_name = 'Comp. Sci.';

-- AVG CLAUSE --
-- Find the average salary of instructors in the Comp. Sci. department.
SELECT 
    AVG(salary)
FROM
    `instructor`
WHERE
    dept_name = 'Comp. Sci.';

-- COUNT CLAUSE --
-- Find the total number of courses with a course in the SS 2010 semester.
SELECT 
    COUNT(DISTINCT course_id)
FROM
    `section`
WHERE
    semester = 'SS' AND year = 2010;

-- Find the number of tuples in the course relation.
SELECT 
    COUNT(*)
FROM
    `course`;

-- GROUP BY CLAUSE --
-- Find the average salary of instructors in each department.
SELECT 
    dept_name, AVG(salary) AS avg_salary
FROM
    `instructor`
GROUP BY dept_name;

-- HAVING CLAUSE --
-- Find the names and average salaries of all departments whose average salary is greater than 42,000.
SELECT 
    dept_name, AVG(salary)
FROM
    `instructor`
GROUP BY dept_name
HAVING AVG(salary) > 42000;


-- SUBQUERIES --
-- IN CLAUSE --
-- Find courses offered in FW 2009 and in SS 2010.
SELECT DISTINCT
    course_id
FROM
    `section`
WHERE
    semester = 'FW' AND year = 2009
        AND course_id IN (SELECT 
            course_id
        FROM
            `section`
        WHERE
            semester = 'SS' AND year = 2010);

-- NOT IN CLAUSE --
-- Find courses offered in FW 2009 but not in SS 2010.
SELECT DISTINCT
    course_id
FROM
    `section`
WHERE
    semester = 'FW' AND year = 2009
        AND course_id NOT IN (SELECT 
            course_id
        FROM
            `section`
        WHERE
            semester = 'SS' AND year = 2010);

-- SOME CLAUSE --
-- Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department
SELECT 
    name
FROM
    `instructor`
WHERE
    salary > SOME (SELECT 
            salary
        FROM
            `instructor`
        WHERE
            dept_name = 'Biology');

-- ALL CLAUSE --
-- Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.
SELECT 
    name
FROM
    `instructor`
WHERE
    salary > ALL (SELECT 
            salary
        FROM
            `instructor`
        WHERE
            dept_name = 'Biology');
        
-- EXISTS CLAUSE --
-- Find all courses taught in both the FW 2009 semester and in the SS 2010 semester.
SELECT 
    course_id
FROM
    `section` AS S
WHERE
    semester = 'FW' AND year = 2009
        AND EXISTS( SELECT 
            *
        FROM
            `section` AS T
        WHERE
            semester = 'SS' AND year = 2010
                AND S.course_id = T.course_id);

-- List all departments along with the number of instructors in each department.
SELECT 
    dept_name,
    (SELECT 
            COUNT(*)
        FROM
            `instructor`
        WHERE
            `department`.dept_name = `instructor`.dept_name) AS num_instructors
FROM
    `department`;

-- VIEWS --
-- Create a view of instructors without their salary.
-- DROP VIEW `faculty`;
CREATE VIEW `faculty` AS
    SELECT 
        ID, name, dept_name
    FROM
        `instructor`;

-- Find all instructors name in the Biology department.
SELECT 
    name
FROM
    `faculty`
WHERE
    dept_name = 'Biology';
    
-- Add a new tuple to faculty view which we defined earlier.
INSERT INTO `faculty` VALUES ('30765', 'Green', 'Music');

SELECT 
    *
FROM
    `instructor`;

-- Create a view of department salary totals.
-- DROP VIEW `departments_total_salary`;
CREATE VIEW `departments_total_salary` (dept_name , total_salary) AS
    SELECT 
        dept_name, SUM(salary)
    FROM
        `instructor`
    GROUP BY dept_name;

-- Create a view with class IDs, section ID, and building information taught in the physics FW 2009 course.
-- DROP VIEW `physics_fw_2009`;
CREATE VIEW `physics_fw_2009` AS
    SELECT 
        `course`.course_id, sec_id, building
    FROM
        `course`,
        `section`
    WHERE
        `course`.course_id = `section`.course_id
            AND `course`.dept_name = 'Physics'
            AND `section`.semester = 'FW'
            AND `section`.year = '2009';

-- Find all course id, section id, and building name in the physics FW 2009 course.
SELECT 
    *
FROM
    `physics_fw_2009`;

-- Create a view with information on the courses taught in the Watson building among the courses taught in the physics department in the fall of 2009.
-- DROP VIEW `physics_fw_2009_watson`;
CREATE VIEW `physics_fw_2009_watson` AS
    SELECT 
        course_id, building
    FROM
        `physics_fw_2009`
    WHERE
        building = 'Watson';

-- Find all course id and building name in the physics FW 2009 course in the Watson building.
SELECT 
    *
FROM
    `physics_fw_2009_watson`;

-- Create a view with information on the courses taught in the watson building among the courses taught in the physics department in the fall of 2009.
DROP VIEW `physics_fw_2009_watson`;
CREATE VIEW `physics_fw_2009_watson` AS
    SELECT 
        course_id, sec_id, building
    FROM
        (SELECT 
            `course`.course_id, sec_id, building
        FROM
            `course`, `section`
        WHERE
            `course`.course_id = `section`.course_id
                AND `course`.dept_name = 'Physics'
                AND `section`.semester = 'FW'
                AND `section`.year = '2009') AS `physics_fw_2009`
    WHERE
        building = 'Watson';

-- Find all course id, section id, and building name in the physics FW 2009 course in the Watson building.
SELECT 
    *
FROM
    `physics_fw_2009_watson`;

-- 
-- DROP VIEW `instructor_info`;
CREATE VIEW `instructor_info` AS
    SELECT 
        ID, name, building
    FROM
        `instructor`,
        `department`
    WHERE
        `instructor`.dept_name = `department`.dept_name;

-- 
INSERT INTO `instructor_info` VALUES ('69987', 'White', 'Taylor');

--
-- DROP VIEW `history_instructors`;
CREATE VIEW `history_instructors` AS
    SELECT 
        *
    FROM
        `instructor`
    WHERE
        dept_name = 'History';

SELECT 
    *
FROM
    `instructor`;

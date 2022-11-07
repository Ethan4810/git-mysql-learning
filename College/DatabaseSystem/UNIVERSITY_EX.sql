SHOW DATABASES; 

## CREATE `UNIVERSITY` DATABASE
DROP DATABASE `UNIVERSITY_EX`;
CREATE DATABASE `UNIVERSITY_EX`;
USE `UNIVERSITY_EX`;


## CREATE TABLES
-- CREATE `dept_ex` TABLE
CREATE TABLE `dept_ex` (
    dept_code INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

-- Create the table and use the “on update cascade”, “on delete cascade”, “on delete set null”.
-- CREATE `stud_ex` TABLE
CREATE TABLE `stud_ex` (
    stud_id INT PRIMARY KEY,
    dept_code INT,
    name VARCHAR(20),
    FOREIGN KEY (dept_code)
        REFERENCES `dept_ex` (dept_code)
        ON UPDATE CASCADE ON DELETE SET NULL
);


## INSERTION
-- INSERT VALUES INTO `dept_ex` TABLE
INSERT INTO `dept_ex` VALUES
(101, 'Comp. Sci.'), 
(102, 'Elec. Eng.'), 
(201, 'Biology'), 
(202, 'Finance');

-- INSERT VALUES INTO `stud_ex` TABLE
INSERT INTO `stud_ex` VALUES
(20201234, 101, 'Gildong Hong'), 
(20191211, 201, 'Gachon Kim'), 
(20184213, 102, 'Jiwoo Choi'), 
(20171235, 101, 'Yongjoon Bae'),
(20209822, 202, 'Minsoo Choi'),
(20192385, 102, 'Minho Lee'),
(20195431, 101, 'Minkook Song');


## MODIFICATION
# UPDATE
-- Change the software department's code to 501 and make sure all the changed values are reflected in other related databases.
UPDATE `dept_ex`
SET 
    dept_code = 501
WHERE
    dept_name = 'Comp. Sci.';

# DELETE
-- Delete the chemistry department code and change the department code of chemistry students to null.
DELETE FROM dept_ex 
WHERE
    dept_name = 'Biology';


## BASIC OPERATIONS
# SELECT CLAUSE
-- Find all information from dept_ex table.
SELECT 
    *
FROM
    `dept_ex`;

-- Find all information from stud_ex table.
SELECT 
    *
FROM
    `stud_ex`;

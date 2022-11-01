DROP DATABASE my_test;
CREATE DATABASE my_test;
USE my_test;

CREATE TABLE my_test.clients(
    id INT(6) PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255)
)
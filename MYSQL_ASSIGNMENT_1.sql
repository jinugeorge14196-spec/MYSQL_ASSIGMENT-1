-- Drop the database if it exists and recreate it
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

-- 1. Location Table
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- 2. Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 3. Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);
-- 1. Add a new column named "email" to the Employees table
ALTER TABLE employees ADD COLUMN email VARCHAR(100);

-- 2. Modify the data type of the "designation" column to support a wider range of values
ALTER TABLE employees MODIFY COLUMN designation VARCHAR(255);

-- 3. Drop the "age" column from the Employees table
ALTER TABLE employees DROP COLUMN age;

-- 4. Rename the "hire_date" column to "date_of_joining"
ALTER TABLE employees RENAME COLUMN hire_date TO date_of_joining;
-- 1. Rename the "departments" table to "Departments_Info"
RENAME TABLE departments TO Departments_Info;

-- 2. Rename the "location" table to "Locations"
RENAME TABLE location TO Locations;
-- Step 4: Truncate the employees table
TRUNCATE TABLE employees;

-- Step 5: Drop the Employees table and the employee database
DROP TABLE IF EXISTS employees;
DROP DATABASE IF EXISTS employee;
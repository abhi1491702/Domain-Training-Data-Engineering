-- Create the database
CREATE DATABASE IF NOT EXISTS coding_challenge1;
USE coding_challenge1;

-- Create 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    manager_id INT
);

-- Create 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert sample data into 'employees' table
INSERT INTO employees (employee_id, employee_name, department_id, manager_id)
VALUES
    (1, 'John Doe', 1, 3),
    (2, 'Jane Smith', 1, 3),
    (3, 'Bob Johnson', 2, 4),
    (4, 'Alice Brown', 2, 4),
    (5, 'Eva White', 1, 3),
    (6, 'Mike Black', 2, 4),
    (7, 'Sara Green', 1, 3),
    (8, 'Tom Grey', 1, 3),
    (9, 'Alex Turner', 2, 4),
    (10, 'Linda Carter', 2, 4);

-- Insert sample data into 'departments' table
INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Marketing'),
    (5, 'Operations');

-- Perform INNER JOIN
SELECT employees.employee_id, employees.employee_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- Perform LEFT JOIN
SELECT employees.employee_id, employees.employee_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;


-- Perform RIGHT JOIN
SELECT employees.employee_id, employees.employee_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;

-- Perform FULL JOIN

SELECT employees.employee_id, employees.employee_name, departments.department_name
FROM employees
FULL JOIN departments ON employees.department_id = departments.department_id
LIMIT 0, 1000;

-- Perform CROSS JOIN
SELECT employees.employee_id, employees.employee_name, departments.department_name
FROM employees
CROSS JOIN departments;

-- Perform SELF JOIN
SELECT e1.employee_name, e2.employee_name
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- Equi-Join
SELECT employees.employee_id, employees.employee_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- Non-Equi Join
SELECT e1.employee_name AS employee, e2.employee_name AS manager
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;

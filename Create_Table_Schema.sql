-- Creating table schema

-- Create table departments

DROP TABLE departments

CREATE TABLE departments (
  dept_no VARCHAR(30) NOT NULL,
  dept_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (dept_no)
);

select * from departments


-- Create table employees

DROP TABLE employees

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title varchar(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

select * from employees


--Create table dept_emp

DROP TABLE dept_emp

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	 PRIMARY KEY(emp_no, dept_no)
);

select * from dept_emp


-- Create table dept_managers

DROP TABLE dept_manager

CREATE TABLE dept_manager (
 dept_no VARCHAR (30) NOT NULL,
 emp_no INT NOT NULL,
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
 FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);

select * from dept_manager



--Creating salaries table

DROP TABLE salaries

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary BIGINT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
	primary key(emp_no)
);

select * from salaries


--Creating titles table

DROP TABLE titles

CREATE TABLE titles (
	title_id varchar(30) NOT NULL,
	title VARCHAR(40) NOT NULL,
	PRIMARY KEY(title_id)
);

select * from titles

alter database employee_db set datestyle TO "ISO,MDY";
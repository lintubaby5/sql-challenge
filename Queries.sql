--List the employee number, last name, first name, sex, and salary of each employee
select e.emp_no as EmployeeNumber,
last_name as LastName,
first_name as FirstName,
sex as Sex,
Salary as Salary
from employees e 
inner join salaries s
on e.emp_no=s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
select first_name as FirstName,
last_name as LastName,
hire_date as HireDate
from employees
where DATE_PART('year',hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.dept_no, 
d.dept_name,
dm.emp_no,
e.last_name, 
e.first_name
from dept_manager dm
left join departments d
on dm.dept_no = d.dept_no
left join employees e
on dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select
e.emp_no,
e.last_name,
e.first_name,
de.dept_no,
d.dept_name
from employees e
inner join dept_emp de on e.emp_no=de.emp_no
inner join departments d on d.dept_no=de.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name as FirstName,
last_name as LastName,
sex as Sex
from employees
where first_name='Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no,
e.last_name,
e.first_name
from employees e 
left join dept_emp de on e.emp_no=de.emp_no
inner join departments d on d.dept_no=de.dept_no
where dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees e 
left join dept_emp de on e.emp_no=de.emp_no
inner join departments d on d.dept_no=de.dept_no
where dept_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,count(*) as frequencycount
from employees
group by last_name
order by count(*) desc
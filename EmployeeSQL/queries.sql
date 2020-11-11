--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Sex",
	r.salary AS "Salary"
FROM employees AS e
JOIN salaries AS r
ON (e.emp_no = r.emp_no);
  
--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	d.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	n.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"
FROM departments AS d
JOIN dept_manager as n
ON d.dept_no = n.dept_no
JOIN employees as e
ON n.emp_no = e.emp_no	
	
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE 
	first_name = 'Hercules'
	AND
	last_name LIKE 'B%'
	
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	de.emp_no AS "Employee Number",
	e.first_name AS "First Name",
	e.last_name AS "Last Name",
	d.dept_name AS "Department Name"
FROM dept_emp AS de
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	de.emp_no AS "Employee Number",
	e.first_name AS "First Name",
	e.last_name AS "Last Name",
	d.dept_name AS "Department Name"
FROM dept_emp AS de
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name= 'Development';
	
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT
	last_name AS "Last Name",
	COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC
;

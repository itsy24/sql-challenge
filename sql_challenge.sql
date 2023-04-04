--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   e.sex,
	   s.salary
FROM employees e
INNER JOIN salaries s ON
		   e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
		last_name,
		hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--List the manager of each department along with their department number, department name, employee number, last & first name.
SELECT  dm.dept_no,
		d.dept_name,
		e.emp_no,
		e.last_name,
	    e.first_name
FROM employees e
INNER JOIN department_manager dm ON
		   e.emp_no = dm.emp_no
INNER JOIN departments d ON
		   dm.dept_no = d.dept_no;

--List the depart number for each employee along with that employee’s employee number,last & first name, and depart name.
SELECT  de.dept_no,
		e.emp_no,
		e.last_name,
	    e.first_name,
		d.dept_name
FROM employees e
INNER JOIN department_employee de ON
	       e.emp_no = de.emp_no
INNER JOIN departments d ON
	       de.dept_no = d.dept_no;

--List first & last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
	   last_name,
	   sex 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department,including their employee number, last name, and first name.
SELECT e.emp_no,
	   e.last_name,
	   e.first_name
FROM employees e
WHERE emp_no IN
	(SELECT emp_no
	FROM department_employee
	WHERE dept_no IN 
		(SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'));

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e
INNER JOIN department_employee de ON
		   e.emp_no = de.emp_no
INNER JOIN departments d ON
		   de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, COUNT(e.last_name) AS "Number of Employees Who Share This Last Name"
FROM employees e
WHERE e.last_name = e.last_name 
GROUP BY e.last_name
ORDER BY "Number of Employees Who Share This Last Name" DESC;





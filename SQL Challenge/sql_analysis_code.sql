-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees INNER JOIN salaries
ON employees.emp_no =salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT emp_no, last_name, first_name
FROM employees
Where hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
Select  dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name,employees.first_name,dept_manager.from_date, dept_manager.to_date  
FROM dept_manager
INNER JOIN department ON dept_manager.dept_no = department.dept_no
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the 
-- following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, first_name,department.dept_name
FROM employees INNER JOIN dept_manager ON employees.emp_no =dept_manager.emp_no
INNER JOIN department ON dept_manager.dept_no =department.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no,last_name,first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT employees.emp_no, employees.last_name,employees.first_name, department.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN department ON dept_emp.dept_no =department.dept_no
WHERE dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN department ON dept_emp.dept_no =department.dept_no
WHERE dept_name IN('Sales', 'Development' ) ;


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;

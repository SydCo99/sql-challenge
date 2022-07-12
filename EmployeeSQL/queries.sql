--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_number, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_number=salaries.emp_number;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.emp_number, departments.dept_number, departments.dept_name, employees.first_name, employees.last_name
FROM dept_manager 
INNER JOIN departments ON 
dept_manager.dept_number = departments.dept_number
INNER JOIN employees ON 
dept_manager.emp_number = employees.emp_number;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_number, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON 
employees.emp_number = dept_emp.emp_number
INNER JOIN departments ON 
dept_emp.dept_number = departments.dept_number;

--List first name, last name, and sex for employees whose first name is "Hercules" and 
--last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' and last_name ~ '^B';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
SELECT employees.emp_number, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON 
employees.emp_number = dept_emp.emp_number
INNER JOIN departments ON 
dept_emp.dept_number = departments.dept_number
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT employees.emp_number, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON 
employees.emp_number = dept_emp.emp_number
INNER JOIN departments ON 
dept_emp.dept_number = departments.dept_number
WHERE dept_name = 'Sales' or dept_name = 'Development';

--List the frequency count of employee last names (i.e., how many employees share each last name) 
--in descending order.
SELECT last_name, COUNT(last_name) AS Frequency 
FROM employees 
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC; 







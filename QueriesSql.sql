---- List the following details of each employee: employee number, last name, first name, gender, and salary.

select
employees.emp_no,
employees.first_name,
employees.last_name,
employees.gender,
salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

---List employees who were hired in 1986.
select
employees.hire_date,
employees.first_name,
employees.emp_no
from employees
where extract(year from hire_date) = '1986'; 

---List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select
dept_manager.dept_no,
dept_manager.emp_no,
dept_manager.from_date,
dept_manager.to_date,
employees.first_name,
employees.last_name,
departments.dept_name
from dept_manager
join employees
on dept_manager.emp_no = employees.emp_no
join departments 
on departments.dept_no = dept_manager.dept_no;

--- List the department of each employee with the following information: employee number, last name, first name, and department name.

select 
employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments 
on departments.dept_no = dept_emp.dept_no;

---List all employees whose first name is "Hercules" and last names begin with "B."

select 
employees.first_name,
employees.last_name
from employees
where first_name = 'Hercules' and last_name like 'B%';

---List all employees in the Sales department, including their employee number, last name, first name, and department name.

select
employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales';

---List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select
employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments 
on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

---In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select 
employees.last_name,
count (last_name) as ln_cnt
from employees
group by last_name
order by ln_cnt desc;
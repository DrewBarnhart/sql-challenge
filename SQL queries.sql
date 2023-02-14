-- List the employee number, last name, first name, sex, and salary of each employee.
-- select the columns youll need from the tables 
select employees.emp_no,
	last_name,
	first_name, 
	sex, 
	salary  
from employees 

-- join with salaries to get the salary information 
--(since employees table didnt include this information)
left join salaries on employees.emp_no=salaries.emp_no;

-- ----------------------------------------------------------------------------
-- List the first name, last name, and hire date for the employees who were hired in 1986.
select 
	first_name,
	last_name,
	hire_date
	
from employees 
where hire_date LIKE '%1986';

-- ----------------------------------------------------------------------------------
-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.

--select the columns and correlating tables you'll need 
Select dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
From dept_manager

-- join with departments and employees (use left join to not lose any columns)
left Join departments on departments.dept_no = dept_manager.dept_no
left Join employees on employees.emp_no = Dept_manager.emp_no;

------------------------------------------------------------------------------------------
-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.

select departments.dept_no,
		employees.emp_no,
		employees.first_name,
		employees.last_name,
		departments.dept_name
from employees

--join w/ departments
left join departments on departments.dept_no = departments.dept_no;

----------------------------------------------------------------------------------------------

-- List first name, last name, and sex of each employee whose first name 
-- is Hercules and whose last name begins with the letter B.
--use like function, only need to use employee table

select employees.first_name,
		employees.last_name,
		employees.sex
from employees

where first_name = 'Hercules' and last_name like 'B%';

---------------------------------------------------------------------------------

-- List each employee in the Sales department, including their employee number, 
--last name, and first name.

--join employees with dept employee and departments 

select employees.emp_no,
		employees.last_name,
		employees.first_name
-- I added dept name jsut to double check that only "sales" sept was showing
		departments.dept_name
from employees 

Join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where dept_name = 'Sales';

-- ----------------------------------------------------------------------------------------

-- List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

Select employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees

left join dept_manager on employees.emp_no=Dept_manager.emp_no
left join departments on dept_manager.dept_no=departments.dept_no
Where dept_name = 'Sales' or dept_name='Development';

--------------------------------------------------------------------------------------------
-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

--- select the column last  name from the employees table, count the frequency/total number 
-- of time that last name occurs. grouby the last name, then order in descending order using DESC
Select last_name, Count(last_name) as "counts"
From employees
Group by last_name
Order by "counts" DESC;

--- I was curious about the ascending order 'Only 1 count for foolsday :(' 
Select last_name, Count(last_name) as "counts"
From employees
Group by last_name
Order by "counts" ASC;
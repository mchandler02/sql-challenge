--Querying tables
--#1
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on
e.emp_no=s.emp_no;

--#2
select first_name, last_name, hire_date
from employees
where hire_date like'%1986';

--#3
select dept.dept_no, dept.dept_name, mgr.emp_no, emp.last_name, emp.first_name
from dept_manager as mgr
join departments as dept on
mgr.dept_no=dept.dept_no
join employees as emp on
mgr.emp_no=emp.emp_no;

--#4***
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as de on
emp.emp_no=de.emp_no
join departments as dept on
de.dept_no=dept.dept_no;

--#5
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--#6*** need dept name
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as de on
emp.emp_no=de.emp_no
join departments as dept on
de.dept_no=dept.dept_no
where dept.dept_name = 'Sales';

--#7*** need dept name
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as de on
emp.emp_no=de.emp_no
join departments as dept on
de.dept_no=dept.dept_no
where dept.dept_name = 'Sales' or dept.dept_name = 'Development';

--#8
select last_name, count(last_name) as "Count"
from employees
group by last_name
order by "Count" desc;
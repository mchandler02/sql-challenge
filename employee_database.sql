create table departments(
	dept_no varchar primary key,
	dept_name varchar
);
select * from departments;
--drop table departments;

create table dept_emp(
	emp_no int,
	dept_no varchar,
	primary key (emp_no, dept_no),
	foreign key (dept_no) references departments (dept_no)
);
select * from dept_emp;
--drop table dept_emp;

create table dept_manager(
	dept_no varchar,
	emp_no int primary key,
	foreign key (emp_no,dept_no) references dept_emp(emp_no, dept_no)
);
select * from dept_manager;
--drop table dept_manager;

create table titles(
	title_id varchar primary key,
	title varchar
);
select * from titles;
--drop table titles;

create table employees(
	emp_no int primary key,
	emp_title varchar,
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date varchar,
	foreign key (emp_no) references dept_manager(emp_no),
	foreign key (emp_title) references titles (title_id)
);
select * from employees;
--drop table employees;

create table salaries(
	emp_no int primary key,
	salary int,
	foreign key (emp_no) references employees(emp_no)
);
select * from salaries;
--drop table salaries;

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

























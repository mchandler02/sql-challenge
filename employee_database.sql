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



























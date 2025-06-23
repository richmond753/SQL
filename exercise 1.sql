create table employees(
emp_id int primary key,
first_name varchar(10),
last_name varchar(10),
birth_date date,
sex varchar(1),
salary int,
super_id int,
branch_id int
);
create table branch(
branch_id int primary key,
branch_name varchar(20),
mgr_id int,
mgr_start_date date,
foreign key(mgr_id) references employees(emp_id) on delete set null 
);
alter table employees
add foreign key(branch_id) references branch(branch_id) on delete set null;
alter table employees
add foreign key(super_id) references employees(emp_id) on delete set null;
create table client(
client_id int primary key,
client_name varchar(30),
branch_id int,
foreign key(branch_id) references branch(branch_id) on delete set null
);
create table works_with(
emp_id int,
client_id int,
total_sales int,
primary key(emp_id, client_id),
foreign key(emp_id) references employees(emp_id) on delete cascade,
foreign key(client_id) references client(client_id) on delete cascade
);
insert into employees values(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
insert into branch values(1, 'corporate', 100, '2006-02-09');
update employees
set branch_id = 1
where emp_id = 100;
insert into employees values(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
insert into employees values(102, 'Micheal', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
insert into branch values(2, 'Scranton', 102, '1992-04-06');
update employees
set branch_id = 2
where emp_id = 102;
insert into employees values(103, 'Kelly', 'Kapoor', '1961-05-11', 'F', 110000, 102, 2);
insert into employees values(104, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
insert into employees values(106, 'Josh','Porter', '1969-09-22', 'M', 78000, 100, Null);
insert into branch values(3, 'Stamford', 106, '1996-03-11');
UPDATE employees
set branch_id = 3
where emp_id = 106;
insert into employees values(107, 'Andy', 'Bernard', '1961-05-11', 'M', 65000, 106, 3);
insert into employees values(108, 'Kelly', 'Adjaho', '1965-06-11', 'M', 71000, 106, 3);
insert into employees values(109, 'Kelmah', 'Klo', '1961-05-11', 'M', 110000, 106, 3);
select * from employees;
select * from branch;
drop table branch;
drop table employee;


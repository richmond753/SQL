create database rich1db;
use rich1db;
/* THis is a Library Management Database 2(PROJECT 2 */

Create table Employee(
emp_id char(5) primary key,
emp_name varchar(20),
position varchar(10),
salary int,
branch_id varchar(5)
);
create table Branch(
branch_id char(15) primary key,
manager_id char(15),
branch_address varchar(35),
contact_number float,
foreign key(manager_id) references Employee(emp_id)
);
create table Books(
book_title varchar(25) primary key,
category char(10),
rental_price decimal(3,2),
status_response char(3),
author varchar(25)
);
create table Issue_Status(
issued_id char(5) primary key,
issued_member_id char(5),
issued_book_name varchar(25),
issued_date date,
issued_emp_id  char(5),
foreign key(issued_book_name) references Books(book_title),
foreign key(issued_emp_id) references Employee(emp_id)
);
create table Return_Status(
return_id char(5) primary key,
issued_id char(5),
return_book_name CHAR(10),
return_date date,
foreign key(issued_id) references Issue_Status(issued_id)
);

/*Inserting Data into the Employee table*/
insert into Employee values('E101', 'John Doe', 'Clerk', 60000, 'B001');
insert into Employee values('E102', 'Jane Smith', 'Clerk', 45000, 'B002');
insert into Employee values('E103', 'Mike Johnson', 'Librarian', 65000, 'B001');
insert into Employee values('E104', 'Emily Davis', 'Assistant', 40000, 'B001');
insert into Employee values('E105', 'Sarah Brown', 'Assistant', 42000, 'B001');
insert into Employee values('E106', 'Jessica Taylor', 'Manager', 76000, 'B003');
insert into Employee values('E107', 'Daniel Anderson', 'Manager', 86000, 'B005');
insert into Employee values('E108', 'Laura Martinez', 'Manager', 96000, 'B004');
insert into Employee values('E109', 'Christopher Lee', 'Assistant', 70000, 'B003');
insert into Employee values('E110', 'Micheal Thompson', 'Clerk', 65000, 'B005');

/* Inserting Data into Branch table*/
insert into Branch values('B001', 'E109', '123-Main-Street', +91109840499);
insert into Branch values('B002', 'E109', '456-Elm-Street', +91190899179);
insert into Branch values('B003', 'E109', '789-Oak-Street', +9110999867);
insert into Branch values('B004', 'E110', '567-Pine-Street', +9195864760);
insert into Branch values('B005', 'E110', '890-Maple-Street', +9109950680);

/*Inserting Data into Books table*/
insert into Books values('Animal Farm', 'Classic', 5.50, 'Yes', 'George Orwell');
insert into Books values('The Great Gataby', 'Classic', 8.50, 'Yes', 'F.Scott Fitzgerald');
insert into Books values('Jane Eyre', 'Classic', 4.00, 'Yes', 'Charlotte Bronte');
insert into Books values('The Alchemist', 'Fiction', 2.50, 'Yes', 'Panlo Corletto');
insert into Books values('Harry Potter', 'Fantasy', 7.00, 'Yes', 'Jok Rowling');
insert into Books values('A game of thrones', 'Fantasy', 8.00, 'Yes', 'Dan Brown');
insert into Books values('The guns of August', 'History', 7.00, 'Yes', 'Barbar Tuchman');
insert into Books values('The diary of a young girl', 'Fiction', 8.00, 'No', 'Anne Frank');
insert into Books values('The Histoiries', 'History', 7.00, 'No', 'Bantam');
insert into Books values('The Da Vinci Code', 'Mystery', 9.00, 'No', 'Bantam');
insert into Books values('Sapiens', 'Mystery', 5.00, 'No', 'Howard Zilus');

/*Inserting Data into Issued_Status*/
insert into Issue_Status values('IS106', 'C106', 'Animal Farm', '2024-03-10', 'E104');
insert into Issue_Status values('IS107', 'C107', 'The Great Gataby', '2024-03-11', 'E105');
insert into Issue_Status values('IS108', 'C108', 'Jane Eyre', '2024-03-13', 'E103');
insert into Issue_Status values('IS109', 'C109', 'The Alchemist', '2024-03-14', 'E102');
insert into Issue_Status values('IS110', 'C110', 'Harry Potter', '2024-03-15', 'E104');
insert into Issue_Status values('IS111', 'C109', 'The Histoiries', '2024-03-16', 'E109');
insert into Issue_Status values('IS112', 'C109', 'The Da Vinci Code', '2024-03-17', 'E108');
insert into Issue_Status values('IS113', 'C108', 'Sapiens', '2024-03-18', 'E107');
insert into Issue_Status values('IS104', 'C107', 'The guns of August', '2024-03-19', 'E110');
insert into Issue_Status values('IS105', 'C110', 'A game of thrones', '2024-03-20', 'E109');

/*Inserting Data into Return_Status*/
insert into Return_Status values('RS101', NULL, 'IS101', '2023-06-06');
insert into Return_Status values('RS102', NULL, 'IS105', '2023-06-07');
insert into Return_Status values('RS103', NULL, 'IS103', '2023-08-17');
insert into Return_Status values('RS104', NULL, 'IS106', '2024-05-01');
insert into Return_Status values('RS105', NULL, 'IS109', '2024-05-03');
insert into Return_Status values('RS106', NULL, 'IS110', '2024-05-07');
insert into Return_Status values('RS107', NULL, 'IS111', '2024-05-09');
insert into Return_Status values('RS108', NULL, 'IS112', '2024-06-01');
insert into Return_Status values('RS109', NULL, 'IS115', '2024-06-02');
insert into Return_Status values('RS110', NULL, 'IS110', '2024-06-04');
SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Books;
SELECT * FROM Issue_Status;
SELECT * FROM Return_Status;
drop table Employee;
drop table Branch;
drop table Issued_Status;
drop table Books;
Drop table Return_Status;
drop database rich1db;

/*Now about to perform queries on my tables*/
/* My first Query on select*/
select emp_name, salary from Employee;
select * from Issue_Status where issued_emp_id = 'E109';
select return_id, return_date from Return_Status;
select sum(salary) as total_revenue from Employee;
select * from Branch where branch_id in('B001','B005');
select * from Books order by book_title asc;
select * from Books order by author asc, rental_price desc;
select * from Issue_Status where issued_member_id in('C109','C110') order by issued_book_name asc,issued_date desc;
select emp_name as 'Employee Name' from Employee;
select *from Books where book_title like '%Potter';
select * from Books where book_title like '%Vinci%';
select * from Books where book_title like '_apiens';
update  Books set rental_price = 5.00 where book_title = 'The Alchemist';
select * from Books;
select book_title, category, rental_price + 10, status_response, author from Books; 
select book_title, category, rental_price + 10 as 'total_price', status_response, author from Books; 










 



create database richdb;
go
select name from sys.databases where name='richdb';

--A DATABSE TO GIVE INFORMATION ABOUT PRODUCT SALES
--Product Table first
create table Products(
product_id int primary key,
product_name varchar(100),
category varchar(50),
unit_price decimal(10,2)
);
--Sales Table Second
create TABLE Sales(
sale_id int primary key,
product_id int,
quantity_sold int,
sales_date date,
total_price decimal(10,2),
foreign key(product_id) references Products(product_id) on delete set null
);
--Inserting values into Sales
insert into sales values
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 3, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);
--Inserting values now into Products table
insert into Products values
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphone', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 20.00);
select * from Sales;
Select * from Products;
 drop table Products;
 drop table Sales;
 drop database richdb;

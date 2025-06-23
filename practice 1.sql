use assignment;
create table student(
studentNo int primary key,
Lastname varchar(10),
firstName varchar(10),
AddressType varchar(20),
city varchar(15),
Satecity char(2),
zip int,
enroll_date date,
undergrad varchar(3)
);
create table takes(
studentNo int,
courseNo varchar(6),
title varchar(25),
primary key(studentNo, courseNo),
foreign key(studentNo) references student(studentNo) on delete set null
);
alter table student
add foreign key(studentNo) references takes(studentNo) on delete set null;
create table course(
CourseNo varchar(20),
InstName varchar(10),
title varchar(25),
CrHour char(1),
primary key(courseNo, Instname)
);
create table Grade(
InstName varchar(20),
studentNo int,
courseNo varchar(6),
studentGrade char(1),
primary key(studentNo, courseNo),
foreign key(studentNo, courseNo) references takes(studentNo, courseNo) on delete set null,
foreign key(courseNo, Instname) references course(courseNo,Instname) on delete cascade
);
alter table takes
add foreign key(studentNo, courseNo) references Grade(studentNo, courseNo) on delete set null;
alter table course 
add foreign key(courseNo, Instname) references Grade(courseNo, Instname) on delete cascade;
create table instructor(
InstName varchar(10) primary key,
InstOffice varchar(5),
InstRank varchar(20),
foreign key(InstName) references course(Instname) 
);
alter table course 
add foreign key(Instname) references instructor(Instname);
describe student;
describe takes;
describe course;
describe grade;
describe  instructor;


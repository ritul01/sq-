create database tmp;
use tmp;
create table student (
id int primary key,
name varchar(255)
);

insert into student values(1,'Singh');
select * from student;

select 44+11;
select now();
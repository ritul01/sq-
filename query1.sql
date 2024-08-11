use org;

--  Query1
-- Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name as wroker_name from worker;

-- Query 2
-- Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) from worker;

-- Query 3
-- Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;
select department from worker group by department;

-- Query 4
-- Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
-- SUBSTRING(string, start, length)
-- The start position. The first position in string is 1.
select substr(first_name,1,3) from worker;

-- Query 5
--  Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
select instr(first_name,'b') from worker where first_name="Amitabh";

-- Query 6
-- Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
-- LTRIM() would remove it from the left Side.
select rtrim(first_name) from worker;

-- Query 7
-- Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(first_name) from worker;

-- Query 8
-- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
-- Length() Function is used to find the length of the string in a Table.
select distinct department, length(department) from worker;

-- Query 9
-- Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
-- REPLACE(string, from_string, new_string)
select replace(first_name,'a','A') from worker;

-- Query 10
-- Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them and the concat Function can take Whatever number of Arguments are given to it.
-- CONCAT(expression1, expression2, expression3,...)
select concat(first_name,' ',last_name) as complete_name from worker;

-- Query 11
-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
-- By default, the Order that is given out would be in Ascending Order, therefore it is not important to mention the 'ASC' Clause
select * from worker order by first_name asc;

-- Query 12
-- Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
-- The order by clause can be passed multiple statements & not just ordering by some single column!
select * from worker order by first_name asc, department desc;

-- Query 13
-- Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
-- 'IN' Keyword can be used to pass Multiple Possible Arguments for the column being asked values from.
select * from worker where first_name in ('Vipul','Satish');

-- Query 14
-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
-- The 'NOT' Keyword would exclude the values given in the Arguments mentioned by the user.
select * from worker where first_name not in ('Vipul','Satish');

-- Query 15
-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
-- The '*' means that after the 'admin' text you can have any text & it would be still shown in the results.
-- Therefore, we'll be using Wildcards here.
select * from worker where department like 'admin%';

-- Query 16
-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
-- The '%' sign is helpul where there are no characters [NULL Character] or even when they are there, there can be n number of characters
select * from worker where first_name like '%a%';

-- Query 17
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like '%a';

-- Query 18
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
-- Now here, we can't place '%' because it can then be replaced with any number of characters - but here all we want are 6 total alphaberts in the output.
-- Since we are sure about the number of alphabets, we'll be using the '_'.
-- Therefore, the h character would be placed at the 6th position in the String like -> '_____ h'
select * from worker where first_name like '_____h';

-- Query 19
-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
-- We'll be using the 'BETWEEN' Keyword.
select * from worker where salary between 100000 and 500000;

-- Query 20
-- Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where year(joining_date) =2014 and month(joining_date)=02;

-- Query 21
-- Write an SQL query to fetch the count of employees working in the department ‘Admin’.
-- We'll Have to use the 'Aggregate' functions here - they perform calculations on a set of values & return a single value.
select department, count(department) from worker where department="Admin";

-- Query 22
-- Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name," ",last_name) as full_name from worker where (salary>=50000 and salary<=100000);

-- Query 23
-- Write an SQL query to fetch the no. of workers for each department in the descending order.
-- Clearly, Grouping requires to be done here!
select department,count(department) as "total" from worker group by department order by count(department) desc;

-- Query 24
-- Write an SQL query to print details of the Workers who are also Managers.
-- We've the worker details in the 'Workers' table & all the title details in the 'titles' table.
-- We'll apply an inner join on 'Workers' table with 'title' table
-- Since after applying Join, we would get all the column titles from both the tables, if you want to get only one table's columns, you can write it like
-- 'SELECT w.*' FROM ...
select w.* from worker as w inner join title as t
on w.worker_id=t.worker_ref_id where t.worker_title='Manager';

-- Query 25
-- Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
-- We clearly need the Aggregation Function to Group the same worker tiles together
-- And if we've to put the filtering on the group values being returned, we'll be using the 'Having' Keyword.
select worker_title,count(worker_title) as "cnt" from title group by worker_title having count(worker_title)>1;
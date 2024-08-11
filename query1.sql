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
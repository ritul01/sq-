use org;
create table pairs(
A int,
B int
);
insert into pairs values(1,2),(2,4),(2,1),(3,2),(4,2),(5,6),(6,5),(7,8);
select * from pairs;

-- remove reversed pairs
-- Method 1: JOINS
select lt.* from pairs lt left join pairs rt on lt.A=rt.B and lt.B=rt.A
where rt.A is null or lt.A<rt.A;

-- Method 2: corelate subquery
select * from pairs p1 where not exists
(select * from pairs p2 where p1.B=p2.A and p1.A=p2.B and p1.A>p2.A);
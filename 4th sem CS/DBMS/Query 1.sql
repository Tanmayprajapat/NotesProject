create database Test;
use Test;

create table Worker(worker_id int primary key,first_name varchar(20),last_name varchar(20),salary int,joining_date datetime,dept varchar(20));
create table Bonus(worker_ref_id int, bonus_date datetime, bonus_amount int, foreign key(worker_ref_id) references worker(worker_id));
create table Title(worker_ref_id int,worker_title varchar(20), affected_from datetime, foreign key (worker_ref_id) references worker (worker_id));

insert into Worker values
 (001,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
 (002,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
 (003,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
 (004,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
 (005,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
 (006,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
 (007,'Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
 (008,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');

insert into Bonus values
 (001,'2016-02-20 00:00:00',5000), (002,'2016-06-11 00:00:00',3000), (003,'2016-02-20 00:00:00',4000), (001,'2016-02-20 00:00:00',4500), (002,'2016-06-11 00:00:00',3500);

insert into Title values
 (001,'Manager','2016-02-20 00:00:00'),
 (002,'Executive','2016-06-11 00:00:00'),
 (003,'Lead','2016-06-11 00:00:00'),
 (004,'Asst. Manager','2016-06-11 00:00:00'),
 (005,'Manager','2016-06-11 00:00:00'),
 (006,'Lead','2016-06-11 00:00:00'),
 (007,'Executive','2016-06-11 00:00:00'),
 (008,'Executive','2016-06-11 00:00:00');
 
/*printing the worker table*/select * from worker;

/*printing the bonus table*/select * from bonus;

/*printing the title table*/select * from title;

/*01*/select first_name as 'Worker Name' from worker;

/*02*/select upper (first_name) from worker;

/*03*/select distinct dept from worker;

/*04*/select substring(dept,1,3) from worker;

/*05*/select instr (first_name, BINARY'a') from worker where first_name='Amitabh';

/*06*/select rtrim(first_name) from worker;

/*07*/select ltrim(dept) from worker;

/*08*/select distinct dept, length(dept) from worker;

/*09*/select replace(first_name,'a','A') from worker;

/*10*/select concat(first_name,concat(' ' ,last_name)) as 'complete_name' from worker;

/*11*/select * from worker order by first_name asc;

/*12*/select * from worker order by first_name asc ,dept desc;

/*13*/select * from worker where first_name in ('Vipul','Satish');

/*14*/select * from worker where first_name not in ('Vipul','Satish');

/*15*/select * from worker where dept='Admin';

/*16*/select * from worker where first_name like '%a%';

/*17*/select * from worker where first_name like '%a';

/*18*/select * from worker where first_name like '_____h';

/*19*/select * from worker where salary between 100000 and 500000;

/*20*/select * from worker where year(joining_date)=2014 and month(joining_date)=2;

/*21*/select count(*) from worker where dept like 'Admin';

/*22*/select * from worker where salary between 50000 and 100000;

/*23*/select count(*), dept from worker group by dept order by dept desc;

/*prints the values of worker who had got bonus*/select * from worker where worker_id in (select distinct worker_ref_id from bonus);

/*prints the values of total bonus each worker had got*/select worker_ref_id , sum(bonus_amount) from bonus group by worker_ref_id;

/*prints the values of worker and title both*/select * from worker inner join title on worker_id=worker_ref_id;

/*prints the values of first_name and worker_title from table worker and title*/select first_name,worker_title from worker inner join title on worker_id=worker_ref_id;

/*prints the values of worker who had got bonus with total bonus*/select * from worker t1 inner join (select worker_ref_id,sum(bonus_amount) from bonus group by worker_ref_id) t2 on t1.worker_id=t2.worker_ref_id;

/*prints the values of first_name and worker_title from table worker and title*/select w.first_name, t.worker_title from worker w inner join title t on w.worker_id=t.worker_ref_id;

/*prints the table worker from the database org.*/select * from Test.worker;

/*prints the values of the worker whose worker_title is manager*/select w.* from worker w join title t on w.worker_id=t.worker_ref_id where worker_title like "manager"; 

/*prints the worker table and executes only when both the table have same number of rows*/select * from worker union select * from worker;

/*prints the worker table and executes only when both the table have same number of rows*/select * from worker union all select * from worker;

/*prints the values of the worker from bonus table whose worker_ref_id is 1.*/select * from worker where worker_id in(select distinct worker_ref_id from bonus where worker_ref_id=1);

/*prints the values of worker whose first_name is monika with her worker_title*/select W.*, worker_title from worker W inner join title T on W.worker_id=T.worker_ref_id where First_name = 'Monika';

/*prints the values of table bonus with the same worker_id of worker table*/select * from bonus t1 left join worker t2 on t2.worker_id=t1.worker_ref_id;

/*prints the values of table worker with the same worker_ref_id of bonus table*/select * from bonus t1 right join worker t2 on t2.worker_id=t1.worker_ref_id;

/*create the new table with the same values as title*/create table title_clone as select * from title;

/*create the new table as bonus but with no values in it*/create table bonus_clone as select * from bonus where 1 = 0;

/*create the new table with the same values as bonus*/create table bonus_clone like bonus;

/*prints the table title*/select * from title union all select * from title;

/*prints the values of worker and bonus*/select * from worker w left join bonus b on w.worker_id=b.worker_ref_id;

/*prints the values of bonus and worker*/select * from worker w right join bonus b on w.worker_id=b.worker_ref_id;

/*update the values of worker_ref_id =1*/update bonus set bonus_amount = 5000, worker_ref_id = 7 where worker_ref_id =1;

/*apply the full join */select * from worker w left join bonus b on w.worker_id=b.worker_ref_id 
	union 
	select * from worker w right join bonus b on w.worker_id=b.worker_ref_id;

/*insert the values into bonus*/insert into bonus values(9,'2016-02-20 00:00:00',10000);

/*delete the values from worker*/delete from worker where worker_id = 3;

SELECT first_name, w.dept FROM worker w LEFT JOIN (SELECT AVG(salary) AS sal FROM worker GROUP BY dept) AS D ON w.dept = D.dept WHERE salary > sal;	
    
/*select e.ename,c.cname from emp e left join city c where e.cid=c.cid;

select first_name from worker where salary>avg(salary);*/
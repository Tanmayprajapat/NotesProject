use mysql;
show tables;
select * from user;

create database org;
use org;
show tables;

create table worker(WORKER_ID int primary key, FIRST_NAME varchar(20),LAST_NAME varchar(20),

SALARY int, JOINING_DATE date ,DEPARTMENT varchar(20));

alter table worker modify joining_date datetime;

alter table worker change department dept varchar(20);

desc worker;

insert into worker  values
(001,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
(002,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
(003,'Vishal','Singhal',300000,'2014-02-20 09:00:00',	'HR'),
(004,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
(005,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
(006,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
(007,'Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
(008,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');

select worker_id,first_name from worker;

create table Bonus(WORKER_REF_ID int, BONUS_DATE datetime,
BONUS_AMOUNT int, FOREIGN KEY (WORKER_REF_ID) REFERENCES worker(WORKER_ID));

desc bonus;

create table Title(WORKER_REF_ID int, WORKER_TITLE varchar(20), AFFECTED_FROM datetime,
FOREIGN KEY (WORKER_REF_ID) REFERENCES worker(WORKER_ID));

desc title;	
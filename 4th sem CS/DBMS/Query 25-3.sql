select first_name as Worker_Name from worker;
SELECT * FROM WORKER;

SELECT UPPER(FIRST_NAME) AS WORKER_firstNAME,UPPER(LAST_NAME) AS WORKER_Last_NAME FROM WORKER;

select distinct dept from worker;

Select substring(Dept,1,3) from Worker;

select instr(first_name, BINARY 'a') from worker where First_name='Amitabh'
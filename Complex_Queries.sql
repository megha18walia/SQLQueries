--How to remove duplicate rows from table

;With CTE As
(
select Worker_Title, Affected_From , ROW_NUMBER() 
Over
(
Partition By Worker_Title, Affected_From Order By Worker_Title
) Row_Number
From Title
)
select Worker_Title, Affected_From from CTE group By WORKER_TITLE, AFFECTED_FROM

----How to find duplicate rows from table

;with CTE As
(
select Worker_Title, Affected_From , Row_Number() over 
(
	partition By Worker_Title, Affected_From order By Worker_Title
) Row_Number from Title
)
select Worker_Title, Affected_From from CTE where Row_Number > 1


-- Find the third highest Salary
declare @N int
set @N = 3

select Salary From
(
select salary , ROW_NUMBER() over 
(
order by salary desc
) SalaryNum
from Worker
) as SALARYCTE where SalaryNum = @N

--How to Show the Max salary and min salary together from student table?
select 
(select max(salary) from Worker) as MaxSalary ,
(select min(salary) from Worker) as MinSalary







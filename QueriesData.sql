--Write a SQL query to fetch the count of employees working in project 'P1'.
select Count(*) from SalaryInfo where Project = 'P1'

--Write a SQL query to fetch employee names having salary greater than or equal to 5000 and less than or equal 10000.
select * from SalaryInfo where salary between 5000 and 10000

--Write a SQL query to fetch project-wise count of employees sorted by project's count in descending order.
select count(*) as Employees from SalaryInfo group by Project Order by Employees desc

--Write a query to fetch only the first name(string before space) from the FullName column of EmployeeDetails table.
select SUBSTRING(FullNAme, 0 , CHARINDEX(' ', FullName, 0)) from EmployeeInfo

--Write a query to fetch employee names and salary records. Return employee details even if the salary record is not present for the employee.
select EF.FullName, SI.Salary from EmployeeInfo EF Left Outer Join SalaryInfo SI on EF.EmpID = SI.EmpID

--Write a SQL query to fetch all the Employees who are also managers from EmployeeDetails table.
select EF1.FullName as EmployeeName from EmployeeInfo EF1 Inner Join EmployeeInfo EF2 on EF1.EmpID = EF2.ManagerID

--Write a SQL query to fetch all employee records from EmployeeDetails table who have a salary record in EmployeeSalary table.
select * from EmployeeInfo where EmpID  in (select EmpID from SalaryInfo)

--OR

select * from EmployeeInfo E where Exists (select EmpID from SalaryInfo S where E.EmpID = S.EmpID)

--Write a SQL query to fetch duplicate records from a table.
;With CTE As 
(
select EmpID, Project, Salary, Row_Number() Over 
(
Partition By EmpID, Project, Salary Order By Salary
)RowNum
From SalaryInfo
)
select EmpID, Project, Salary from CTE where RowNum > 1

--Write a SQL query to fetch only odd rows from table.
Select E.EmpID, E.FullName, E.ManagerID from
(
select * , ROW_NUMBER() over
(
order by EmpID 
) RowNum From EmployeeInfo
) E where E.RowNum %2 = 1

--Write a SQL query to fetch only even rows from table.
select E.EmpID, E.FullName, E.ManagerID from
(
select *, ROW_NUMBER() over
(
order by EmpID
)RowNum From EmployeeInfo
)E where E.RowNum %2 = 0

--Write a SQL query to create a new table with data and structure copied from another table.
select * into SalayInfoNew from SalaryInfo

--Write a SQL query to create an empty table with same structure as some other table.
select * into SalaryInfoEmpty from SalaryInfo where 1 = 0

--Write a SQL query to fetch all the Employees details from EmployeeDetails table who joined in Year 2011.
select * from EmployeeInfo where YEAR(DateOfJoining) = 2011

--Write a SQL query to fetch top n records
select Top 2 * from SalaryInfo Order by Salary desc

--Write SQL query to find the nth highest salary from table.
select Top 1 *  from
(
	select Top 3 * from SalaryInfo order by Salary  
) T


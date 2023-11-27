-- Practicing
-- Views
-- Subquery
-- CTE
-- Row_Number() and Rank()
-- Partition By
-- Difference between CTE, View and Subquery


Drop table Employees;
Drop table Department;

select * from Employees;
select * from Department;


CREATE TABLE Employees
(
     ID INT,
     Name VARCHAR(50),
     DepartmentId int,
     Salary int
);

CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50)
)
GO

-- Populate the Department Table with test data
INSERT INTO Department VALUES(1, 'IT')
INSERT INTO Department VALUES(2, 'HR')
INSERT INTO Department VALUES(3, 'Sales')


INSERT INTO Employees Values (1, 'James', 2, 15000)
INSERT INTO Employees Values (2, 'Smith', 2, 35000)
INSERT INTO Employees Values (3, 'Rasol', 2, 15000)
INSERT INTO Employees Values (4, 'Rakesh', 1, 35000)
INSERT INTO Employees Values (5, 'Pam', 1, 42000)
INSERT INTO Employees Values (6, 'Stokes', 3, 15000)
INSERT INTO Employees Values (7, 'Taylor', 3, 67000)
INSERT INTO Employees Values (8, 'Preety', 1, 67000)
INSERT INTO Employees Values (9, 'Priyanka', 1, 55000)
INSERT INTO Employees Values (10, 'Anurag', 2, 15000)
INSERT INTO Employees Values (11, 'Marshal', 3, 55000)
INSERT INTO Employees Values (12, 'David', 2, 96000)
INSERT INTO Employees Values (13, 'Salil', 2, 16000)




-- Views
Create View vwEmpDeptJoin
As
Select emp.ID,
	   emp.Name as EmpName,
	   emp.Salary,
	   dept.Name as DeptName,
	   iif(dept.Name = 'HR', 'Good', 'Bad') As Remarks
From   Employees as emp
Join   Department as dept
On     emp.DepartmentId = dept.ID;

drop view vwEmpDeptJoin
select * from vwEmpDeptJoin;




-- Subquery
-- I only want to join employees and department tables
-- Condition is => join ony those employees whose departmentId is 1 and 3
Select emp.ID,
	   emp.Name as EmpName,
	   emp.Salary,
	   dept.Name as DeptName
From(
	Select * 
	from Employees
	Where DepartmentId In (1,3)
) As emp
Join   Department as dept
On     emp.DepartmentId = dept.ID;





-- Row_number()

-- Note - Order By clause is mandatory when using row_number() and rank()

-- without partition (all records will have a separate row number as it will assume it as a single partition
Select *,
	   ROW_NUMBER() Over (Order By Salary) as RowNumber
from vwEmpDeptJoin


-- with partition
Select *,
	   ROW_NUMBER() Over (Partition By DeptName Order By Salary) as RowNumber
from vwEmpDeptJoin




-- Rank()
-- skips a rank if ranks are repeated

-- without partition
SELECT *,
       RANK() OVER (Order By Salary desc) AS [Rank]
FROM vwEmpDeptJoin


-- with partition
SELECT *,
       RANK() OVER (Partition By DeptName Order By Salary desc) AS [Rank]
FROM vwEmpDeptJoin





-- DENSE_RANK()
-- does not skip a rank if ranks are repeated
SELECT *,
       DENSE_RANK() OVER (Partition By DeptName Order By Salary desc) AS [Rank]
FROM vwEmpDeptJoin




-- Partition By
Select *,
	   Avg(Salary) Over (Partition By DepartmentID) as Average
From Employees

Select *,
	   Max(Salary) Over (Partition By DepartmentID) as Average
From Employees




-- Define the CTE to update data
;WITH EmployeeToUpdate AS (
    SELECT ID, 'Marshal1222' AS NewEmpName
    FROM Employees
    WHERE Name = 'Marshal'
)
-- Update the data in the Employees table based on the CTE
UPDATE Employees
SET Name = NewEmpName	
FROM EmployeeToUpdate;

Select * from Employees;
truncate table Employees;











-- Practicing subquery vs cte

-- Display the department name of the top 5 employees by salary

-- 1. Using Subquery

Select emp.ID,
	   emp.Name,
	   emp.Salary,
	   dept.Name
From(
	   Select Top(5)
				*
	   From Employees
	   Order By Salary desc
) As emp
Join Department As dept
On emp.DepartmentId = dept.ID;


-- 2. Using CTE
;With EmpCTE AS
(
	Select Top(5)
			*
	From Employees
	Order By Salary desc
)
Select emp.ID,
	   emp.Name,
	   emp.Salary,
	   dept.Name
From   EmpCTE As emp  -- change is only this portion of the code
Join   Department As dept
On     emp.DepartmentId = dept.ID;



-- Display the employee with the third highest salary

-- Using Subquery
Select *
From(
	Select *,
	DENSE_RANK() Over (Order By salary desc) As EmpRank
	From Employees
) As emp
Where EmpRank = 3;


-- using CTE
;With EmpRank3SalaryCTE AS
(
	Select *,
	DENSE_RANK() Over (Order By salary desc) As EmpRank
	From Employees
)
Select *
From EmpRank3SalaryCTE
Where EmpRank = 3;



-- Display the names of the employees that has the longest names from each Tech
;With ShowEmployeeInEachTechThatHasTheLongestName As
(
	Select Tech,
		   Max(LEN(Name)) as [MaxLength]
	From Employees
	Group By Tech
)
Select *,
	   LEN(Name) as [NameLength]
From Employees
Where LEN(Name) IN (Select [MaxLength] From ShowEmployeeInEachTechThatHasTheLongestName)



-- Difference between views and CTEs and subqueries




-- views and CTEs (diff given at the end)


-- Example 1
-- Here i want to join employees and department
-- But only those employees should be joined whose salary > 50000


-- using View
select * from vwEmp;
create view vwEmp
As
select Name,
	   Salary,
	   DepartmentId
from Employees
where salary > 50000;

select *
from vwEmp as emp
join Department as dept
on emp.DepartmentId = dept.ID



-- using CTE
With CTEemp As (
	select Name,
		   Salary,
		   DepartmentId
	from Employees
	where salary > 50000
)
select *
from CTEemp as emp
join Department as dept
on emp.DepartmentId = dept.ID



-- using subquery
select *
from (select Name,
		   Salary,
		   DepartmentId
	from Employees
	where salary > 50000) as emp
join Department as dept
on emp.DepartmentId = dept.ID
-- just copy pasted the code of CTEemp in from()







-- Example 2
-- increment the salary of 5 highest salary rankers by 1000 in employeesTable


-- using CTE

-- Step 1: Get the 5 highest salary rankers in employeesTable (but i cannot perform update operation while I am selecting)
Select *
From(
	Select *,
	       DENSE_RANK() Over (Order By salary desc) As EmpRank
	From   Employees
) As emp
Where emp.EmpRank <= 5;


-- Step 2: Wrap the above query in a CTE to perform further actions like update or delete
With lolCTE AS 
(
	Select *
	From(
		Select *,
			   DENSE_RANK() Over (Order By salary desc) As EmpRank
		From   Employees
	) As emp
	Where emp.EmpRank <= 5
)
Update Employees
Set Salary = Salary + 1000
Where ID In (
	select ID
	from lolCTE
)


-- using Views (same code)

select * from lolvw

create view lolvw
AS 
Select *
From(
	Select *,
			DENSE_RANK() Over (Order By salary desc) As EmpRank
	From   Employees
) As emp
Where emp.EmpRank <= 5


Update Employees
Set Salary = Salary + 1000
Where ID In (
	select ID
	from lolvw
)

-- Difference between view and CTE

-- The main difference between the CTE code and the view code is that
-- a view is a persistent object in the database, while a CTE is a temporary object
-- that is created and used within a query.

-- When you create a view, it is stored in the database schema and can be used by any query.
-- When you create a CTE, it is only created for the duration of the query 
-- and is not stored in the database schema.

-- Another difference is that views can be indexed, while CTEs cannot.
-- This means that views can be faster to query than CTEs, especially for large datasets.

-- Another difference between views and CTEs can be - Views are read-only objects,
-- while CTEs can be used to perform DML (Data Manipulation Language)
-- queries on the original table.

-- This is because views are not physical tables.
-- They are simply virtual tables that are created based on a query.
-- CTEs, on the other hand, are temporary tables that are created within a query.
-- This means that you can use CTEs to update, delete, or insert data into the original table.





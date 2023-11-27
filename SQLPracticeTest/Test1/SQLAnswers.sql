 -- 1] Write a SQL query to retrieve the names of employees 
--    along with the titles of the projects they are assigned to.
Select Employees.Name,
	   Project.Title
From   Employees
	   Inner Join Project
On Employees.Id = Project.EmployeeId;


-- 2] Perform a SQL join to fetch the projects and their corresponding client names.
Select ProjectId,
	   Title,
	   CLientId
From   Project;


-- 3] List all employees and their project titles, 
-- including those who are not assigned to any project.
Select Employees.Name,
	   Project.Title
From   Employees
	   Left Join Project
On Employees.Id = Project.EmployeeId;


-- 4] Write a SQL query to calculate the average salary for each department.
Select Department,
	   AVG(Salary) as AverageSalary
From   Employees
Group By Department;


-- 5] Find the total count of employees in each city.
Select City,
	   Count(*) as CityCount
From   Employees
Group By City;


-- 6] Calculate the maximum age of employees in each department.
Select Department,
	   MAX(Age) as MaxAge
From   Employees
Group By Department;


--7] Retrieve the names of employees and their corresponding departments, 
--replacing NULL department values with 'Not assigned'.
Select Name,
	   isNull(Department, 'Not Assigned') as Department
From   Employees;


--8] Display the project titles and employee names.
--Replace NULL employee names with 'Unassigned'.
Select Project.Title,
	   isNull(Employees.Name, 'Unassigned')
From Project
Left Join Employees
On Project.EmployeeId = Employees.Id;


--9] Show employee names and a column indicating 
--whether their salary is above 50000 or not.
Select Name,
	   iif(Salary > 50000, 'Yes', 'No') as Above5000orNot
From   Employees;


--10] Use a CASE statement to categorize employees into
--'Young' if their age is below 30, and 'Old' if 30 or above.
Select Name,
	   iif(Age < 30, 'Young', 'Old') as [Young/Old]
From   Employees;

--OR
Select Name,
	   CASE
		  WHEN Age < 30 THEN 'YOUNG'
		  ELSE 'OLD'
	   END AS [Young/Old]
From Employees;


-- 11] Retrieve the names of employees who are from London.
Select Name
From   Employees
Where  City = 'London';


--12] List the project titles for projects that have not started yet.
Select Title,
	   StartDate
From   Project
Where  StartDate > getdate();


--13] Calculate the average salary of employees for 
--each department and display only those departments 
--with an average salary greater than 40000.
Select Department,
	   AVG(Salary) as AverageSalary
From   Employees
Group By Department
Having AVG(Salary) > 40000;


--14] Display the project titles and their total count. 
--Show only projects with more than 2 employees assigned.
Select Title,
	   Count(*) as EmployeeCount
From   Project
Group By Title
Having Count(*) > 2;


-- 15] Retrieve the top 3 highest earning employees.
Select TOP(3)
	   Name,
	   Salary
From   Employees
Order By 2 Desc;


--16] Show the project titles for the 5 most recently started projects.
Select TOP(5)
	   Title,
	   StartDate
From   Project
Order By StartDate desc;


--17] List employees earning a salary greater than 45000 and aged between 25 and 30.
Select Name,
	   Salary,
	   Age
From   Employees
Where  Salary > 45000 and Age between 25 and 30;


--18] Display projects where the start date is after today.
Select Title,
	   StartDate
From   Project
Where  StartDate > getDate() + 1;


--19] Find employees with a salary equal to or greater than 50000 and whose name contains 'James'.
Select Name,
	   Salary
From   Employees
Where  Salary >= 50000 and Name Like '%James%'


--20] Retrieve projects with titles starting 
--with 'Develop' and having a client ID in (1, 2).
Select Title,
	   ClientId
From   Project
Where  Title Like 'Develop%' AND ClientID IN (1,2)

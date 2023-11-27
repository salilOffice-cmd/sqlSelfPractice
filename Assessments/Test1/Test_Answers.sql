-- Questions 

-- 1.
Select *
From  Employee
Join  Department
On    Employee.DepartmentID = Department.DepartmentID
Where Department.DepartmentName = 'IT';


-- 2.
Select * 
From  Employee
Where FirstName Like 'a%';


-- 3.
Select *
From  Employee
Join  Department
On    Employee.DepartmentID = Department.DepartmentID
Where Department.DepartmentName = 'HR' OR Department.DepartmentName = 'Finance';


-- 4.
Select *
From  Employee
Join  Department
On    Employee.DepartmentID = Department.DepartmentID
Where Department.DepartmentName <> 'IT';


-- 5.
Select *
From  Employee as emp
Join  Department as dept
On    emp.DepartmentID = dept.DepartmentID
Join  EmployeeDetails
On    EmployeeDetails.EmployeeID = emp.EmployeeID
Where dept.DepartmentName = 'Finance' 
	  AND Datepart(Year, EmployeeDetails.JoiningDate) < 2016;


-- 6.
Select concat(FirstName, isNull(LastName, '')) as FullName
From   Employee


-- 7.
Select Employee.FirstName,
	   isNull(Cast(EmployeeDetails.BirthDate as varchar), 'Date of Birth Unknown')
From   Employee
Join   EmployeeDetails
On     EmployeeDetails.EmployeeID = Employee.EmployeeID;


-- 8.
Select emp.EmployeeId,
	   emp.FirstName,
	   emp.LastName,
	   dept.DepartmentName
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID;


-- 9.
Select *
From   Employee as emp
Join   EmployeeDetails as ed
On     ed.EmployeeID = emp.EmployeeID
Where  Datepart(Year, ed.JoiningDate) < 2018;


-- 10.
Select   dept.DepartmentName,
	     Max(ed.Salary) as MaxSalary
From     Employee as emp
Join     Department as dept
On       emp.DepartmentID = dept.DepartmentID
Join     EmployeeDetails as ed
On       ed.EmployeeID = emp.EmployeeID
Group By dept.DepartmentName;


-- 11.
Select   dept.DepartmentName,
	     Count(*) as CountOfEmployees
From     Employee as emp
Join     Department as dept
On       emp.DepartmentID = dept.DepartmentID
Group By dept.Departmentname
Having   Count(*) >= 2;


-- 12.
Select emp.EmployeeID,
	   emp.FirstName,
	   emp.LastName,
	   ed.Salary,
	   dept.DepartmentName
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID
Join   EmployeeDetails ed
On     ed.EmployeeID = emp.EmployeeID
Where  ed.Salary > 60000 AND dept.DepartmentName IN('HR','IT');
	   

-- 13.
Select dept.DepartmentName,
	   concat(emp.FirstName, emp.LastName) as FullName,
	   ed.JoiningDate,
	   ed.Salary,
	   DateDiff(Year, ed.JoiningDate, getdate()) as ExperienceYears
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID
Join   EmployeeDetails ed
On     ed.EmployeeID = emp.EmployeeID;


-- 14.
Update Employee
Set    Employee.isactive = 1
From   Employee
Join   Department
On     Employee.DepartmentID = Department.DepartmentID
Where  Department.DepartmentName = 'HR'

Update Employee
Set    Employee.isactive = 0
From   Employee
Join   Department
On     Employee.DepartmentID = Department.DepartmentID
Where  Department.DepartmentName NOT IN('HR')


-- 15.
Select emp.FirstName,
	   dept.DepartmentName
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID
Where  dept.DepartmentName = 'HR' AND emp.LastName Like 's%';


-- 16.
Select    emp.FirstName,
          emp.LastName,
	      ed.EmployeeDetailsID,
		  dept.DepartmentName
From      Employee as emp
Left Join EmployeeDetails ed
On        ed.EmployeeID = emp.EmployeeID
Join      Department as dept
On        emp.DepartmentID = dept.DepartmentID
Where     ed.EmployeeDetailsID Is Null


-- 17.
Select emp.EmployeeID,
	   emp.FirstName,
	   emp.LastName,
	   ed .*,
	   iif(Salary > 60000, 'Seniors', 'Juniors')
From   Employee as emp
Join   EmployeeDetails ed
On     ed.EmployeeID = emp.EmployeeID


-- 18.
Update EmployeeDetails
Set    JoiningDate = getdate() - 1,
	   BirthDate = getdate() - 1


-- 19.
Select *
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID
Join   EmployeeDetails ed
On     ed.EmployeeID = emp.EmployeeID
Where  emp.EmployeeID IN (1,2,5,8)


-- 20.
/*
	EXEC getAllEmployeeDetails @EmpID = 1
*/

Create Procedure getAllEmployeeDetails @EmpID int
AS
BEGIN 
	Select dept.DepartmentName,
		   emp.EmployeeID,
		   emp.FirstName,
		   emp.LastName,
		   dept.DepartmentID,
		   ed.BirthDate,
		   ed.JoiningDate,
		   ed.Salary
	From   Employee as emp
	Join   Department as dept
	On     emp.DepartmentID = dept.DepartmentID
	Join   EmployeeDetails ed
	On     ed.EmployeeID = emp.EmployeeID
	Where emp.EmployeeID = @EmpID
	
END




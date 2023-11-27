-- group by clause

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee
(
  ID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(100),
  EmailID VARCHAR(100),
  Gender VARCHAR(100),
  Department VARCHAR(100),
  Salary INT,
  Age INT,
  CITY VARCHAR(100)
)

--Insert data into Employee table
INSERT INTO Employee VALUES('PRANAYA','PRANAYA@G.COM','Male', 'IT', 25000, 30,'MUMBAI')
INSERT INTO Employee VALUES('TARUN','TARUN@G.COM','Male', 'Payroll', 30000, 27,'ODISHA')
INSERT INTO Employee VALUES('PRIYANKA','PRIYANKA@G.COM','Female', 'IT', 27000, 25,'BANGALORE')
INSERT INTO Employee VALUES('PREETY','PREETY@G.COM','Female', 'HR', 35000, 26,'BANGALORE')
INSERT INTO Employee VALUES('RAMESH','RAMESH@G.COM','Male','IT', 26000, 27,'MUMBAI')
INSERT INTO Employee VALUES('PRAMOD','PRAMOD@G.COM','Male','HR', 29000, 28,'ODISHA')
INSERT INTO Employee VALUES('ANURAG','ANURAG@G.COM','Male', 'Payroll', 27000, 26,'ODISHA')
INSERT INTO Employee VALUES('HINA','HINA@G.COM','Female','HR', 26000, 30,'MUMBAI')
INSERT INTO Employee VALUES('SAMBIT','HINA@G.COM','Male','Payroll', 30000, 25,'ODISHA')
INSERT INTO Employee VALUES('MANOJ','MANOJ@G.COM','Male','HR', 30000, 28,'ODISHA')
INSERT INTO Employee VALUES('SWAPNA','SWAPNA@G.COM','Female', 'Payroll', 28000, 27,'MUMBAI')
INSERT INTO Employee VALUES('LIMA','LIMA@G.COM','Female','HR', 30000, 30,'BANGALORE')
INSERT INTO Employee VALUES('DIPAK','DIPAK@G.COM','Male','Payroll', 32000, 25,'BANGALORE')

SELECT City, 
	   Count(*) AS CountEMP
FROM   Employee



SELECT COUNT(*) AS TotalEmployee FROM Employee


SELECT Department, COUNT(*) AS TotalEmployee
FROM Employee 
GROUP BY Department


SELECT Department, TotalSalary = SUM(Salary) 
FROM Employee 
GROUP BY Department


SELECT Department, MaxSalary = MAX(SALARY) 
FROM Employee 
GROUP BY Department -- find the highest salary in each department in the organization.


SELECT Department, Gender, EmployeeCount = COUNT(*) 
FROM Employee 
GROUP BY Department, Gender 
ORDER BY Department   --  to get the number of employees working in each Gender per department.


SELECT CITY, SUM(Salary) as TotalSalary 
FROM Employee
GROUP BY CITY  -- Query for retrieving total salaries by the city.



SELECT  City, Gender, SUM(Salary) as TotalSalary, 
    COUNT(ID) as TotalEmployees
FROM Employee
GROUP BY  CITY, Gender  -- Query for retrieving total salaries and the total number of employees by City, and by gender.

SELECT Department, Gender, MAX(Salary), 'Hello' as FixedValue 
FROM Employee 
GROUP BY Department, Gender --Valid


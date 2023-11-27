-- having clause

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
GO


--Insert some test data into Person table
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
GO

WITH RankedEmployees AS (
    SELECT
        e.*,
        RANK() OVER (PARTITION BY e.Department ORDER BY e.Salary DESC) AS SalaryRank
    FROM Employee e
)
SELECT
    Department,
    Salary AS MaxSalary,
    Name
FROM RankedEmployees
WHERE SalaryRank = 1;



Select Department,
		Name,
	   Max(Salary) as MaxSalary
from Employee 
Group By Department;

Select * from Employee


SELECT Department,
	   Gender,
	   MAX(Salary)
FROM Employee
GROUP BY Department, Gender

SELECT Gender,
	   Department,
	   MAX(Salary) As MaxSalary
FROM Employee
GROUP BY Gender, Department


 
SELECT City, SUM(Salary) as TotalSalary
FROM Employee
GROUP BY City
HAVING City = 'MUMBAI'


SELECT City, SUM(Salary) as TotalSalary
FROM Employee
WHERE Gender = 'Male'
GROUP BY City
HAVING City = 'MUMBAI'   --- It is also possible to combine WHERE and HAVING



SELECT City, COUNT(*) AS 'Number of employees'
FROM Employee
GROUP BY City
HAVING COUNT(*) > 4; -- Having Clause Using COUNT Function:


SELECT Department, MIN(Salary) AS 'Lowest salary'
FROM Employee
GROUP BY Department
HAVING MIN(Salary) > 25000; -- Having Clause Using MIN Function:
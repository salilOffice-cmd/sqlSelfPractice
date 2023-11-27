-- Stored Procedures CRUD

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
);
SELECT * FROM Employee;

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



-- 1
-- Getting employee based on the ID
/*
	EXEC spPrac_Employee_sel @ID = 3
	DROP PROCEDURE spPrac_Employee_sel;
*/

Create Procedure spPrac_Employee_sel @ID INT
AS 
BEGIN
	Select * 
	From Employee
	Where ID = @ID;
END;




-- 2
-- Adding Employee
/*
	EXEC spPrac_Employee_insert @Name = "Salil" ,
								@EmailID = "salil.deogade@gmail.com",
								@Gender = "Male",
								@Department = "IT",
								@Salary = 50000,
								@Age = 22,
								@CITY = "Nagpur"
*/
Create Procedure spPrac_Employee_insert @Name VARCHAR(100),
										@EmailID VARCHAR(100),
										@Gender VARCHAR(100),
										@Department VARCHAR(100),
										@Salary INT,
										@Age INT,
										@CITY VARCHAR(100)
AS 
BEGIN 
	INSERT INTO Employee 
	VALUES(@Name,
		   @EmailID ,
		   @Gender,
		   @Department,
		   @Salary,
		   @Age,
		   @CITY)

END;





-- 3
-- Deleting Employee
/*
	EXEC spPrac_Employee_Delete @ID = 3;
*/

CREATE PROCEDURE spPrac_Employee_Delete @ID INT
AS
BEGIN
	DELETE FROM Employee 
	WHERE ID = @ID;
END;





-- 4
-- Updating Employee
/*
	EXEC spPrac_Employee_UpdateName @ID = 10,
									@Name = "Rohit"
*/

CREATE PROCEDURE spPrac_Employee_UpdateName @ID INT,
											@Name varchar(100)
AS
BEGIN
	UPDATE Employee
	SET Name = @Name
	WHERE ID = @ID;
END;
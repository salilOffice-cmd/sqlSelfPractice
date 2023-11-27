-- Merge Statement

-- The MERGE statement in SQL Server is used to perform insert, update, or delete operations
-- on a target table based on the results of a join with a source table.
-- It allows you to perform all three operations in a single statement,
-- which can be very useful when you need to synchronize data between two tables.


-- Let's say we want to update the "Employee" table 
-- based on the data in the "EmployeeUpdates" table.
-- We can use the MERGE statement to do this:

CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee(ID, Name, Salary)
VALUES (1, 'John', 50000),
       (2, 'Jane', 60000),
       (3, 'Bob', 70000);

-- Sample data for SourceTable
CREATE TABLE EmployeeUpdates (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Salary DECIMAL(10, 2)
);

INSERT INTO EmployeeUpdates (ID, Name, Salary)
VALUES (2, 'Jane', 55000),
       (3, 'Bob', 63000),
       (4, 'Alice', 80000);


Select * from Employee;
Select * from EmployeeUpdates;
-- ***************************
Merge Into Employee as targetTable
Using EmployeeUpdates as sourceTable
On (targetTable.ID = sourceTable.ID)
When Matched Then
		Update Set 
			targetTable.Name = sourceTable.Name,
			targetTable.Salary = sourceTable.Salary
When Not Matched By Target Then
		Insert (ID, Name, Salary) Values (sourceTable.ID, sourceTable.Name, sourceTable.Salary)
When Not Matched By Source Then
		Delete;


-- Explanation


--> The MERGE statement joins the "Employee" table with the "EmployeeUpdates" table based on the ID column
Merge Into Employee as targetTable
Using EmployeeUpdates as sourceTable
On (targetTable.ID = sourceTable.ID)



--> When Update?
--  When a match is found, it updates the Name and Salary in the "Employee"
--  table with the corresponding values from the "EmployeeUpdates" table.

When Matched Then
		Update Set 
			targetTable.Name = sourceTable.Name,
			targetTable.Salary = sourceTable.Salary



--> When Insert?
--  When a match is not found in the target table,
--  it inserts the new row from the source table into the target table.
--  In another words, when there is a record that is not in source table but exists in the target table,
--  the record will get inserted in the target table as the source table contains the latest state of the table
When Not Matched By Target Then
		Insert (ID, Name, Salary) Values (sourceTable.ID, sourceTable.Name, sourceTable.Salary)



--> When Delete?
-- When there is a record in target table that does not exist in the source table,
-- then that record will get deleted from the target table as the source table contains the latest state of the table
When Not Matched By Source Then
		Delete;
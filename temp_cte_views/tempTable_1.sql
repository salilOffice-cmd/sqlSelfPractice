-- Learning
-- Select Into
-- Insert Into Select
-- temp table (#tablename)


select * from employees;

CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees
VALUES
    (1, 'John', 'Doe', 'HR', 50000.00),
    (2, 'Jane', 'Smith', 'Sales', 60000.00),
    (3, 'Bob', 'Johnson', 'IT', 75000.00),
    (4, 'Alice', 'Brown', 'Finance', 70000.00);


-- "Select into"
-- Creates a new table with the same schema as the original table
-- (no existing table required to copy the data)
Select *
Into newEmpTable
From employees
Where salary <= 60000;

select * from newEmpTable


-- "insert into select"
-- Copies the data from a table to an already existing table(usually a temp table)
create table #TempEmp(
	employee_id INT,
    first_name VARCHAR(50)
)
Select * from #TempEmp
drop table #TempEmp


Insert into #TempEmp (employee_id, first_name)
Select employee_id, first_name
From employees


-- we can modify the data while copying it to target table
Insert into #TempEmp (employee_id, first_name)
Select employee_id, concat(first_name, ' ', 'NewName')
From employees

Select * from #TempEmp

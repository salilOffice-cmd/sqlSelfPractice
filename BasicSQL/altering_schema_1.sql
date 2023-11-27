-- Playing with columns

create database my;


Create Table Employee(
	EmpId int Primary Key Identity(1,2),
	EmpName varchar(50) Not Null,
	EmpAge smallint
);

Drop table Employee;
Insert into Employee (EmpName, EmpAge)
Values 
('Salil', 22),
('Salil', 22),
('Salil', 22),
('Salil', 22);

Alter Table Employee
Alter Column EmpAge int;  -- change data type of column

Alter Table Employee
Alter Column EmpName varchar(50) Null;  -- change attribute of column

Alter Table Employee
Alter Column int Identity(1,2);

sp_rename 'Employee.EmpId', 'EmployeeId', 'Column'; -- change name of column

select * from Employee;
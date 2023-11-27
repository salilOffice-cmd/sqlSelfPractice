-- Joins

create table courses(
	c_id int Primary key Identity(1,1),
	c_name varchar(100)
);

create table students(
	s_id int Primary key Identity(1,1),
	s_name varchar(100),
	c_id int Foreign Key References courses(c_id)
);

-- JOINS

-- 1. inner join
Select students.s_id,  students.s_name, courses.c_name
From students
INNER JOIN
courses
On students.c_id = courses.c_id;


-- 2. left join or right join
Select students.s_id,  students.s_name, courses.c_name
From students
LEFT JOIN
courses
On students.c_id = courses.c_id;


-- 3. cross join
Select students.s_id,  students.s_name, courses.c_name
From students
CROSS JOIN
courses;

-- 4. Full join
Select students.s_id,  students.s_name, courses.c_name
From students
FULL JOIN
courses
On students.c_id = courses.c_id;


drop table if exists courses;
drop table if exists students;

select * from courses;
select * from students;

insert into courses
values
('Maths'),
('English'),('Chemistry'),('Physics');

insert into students
values
('Salil', 2),
('Anchal', 2),('Apeksha', 1),('Rohit', 4);

insert into students
values
('Sasu', Null)

insert into courses
values
('C#')



-- 5. Self join

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    ManagerID INT
);

-- Insert sample data into the Employees table
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID)
VALUES
    (1, 'Alice', 3),  -- Alice's manager is Carol (EmployeeID 3)
    (2, 'Bob', 3),    -- Bob's manager is Carol (EmployeeID 3)
    (3, 'Carol', 4),  -- Carol's manager is David (EmployeeID 4)
    (4, 'David', NULL), -- David is a top-level manager (ManagerID is NULL)
    (5, 'Eve', 4);    -- Eve's manager is David (EmployeeID 4)
select * from Employees;
select * from Employees;

Select e1.EmployeeID,
	   e1.EmployeeName,
	   e2.EmployeeName as ManagerName
From Employees as e1
Full Join
Employees as e2
On e1.ManagerID = e2.EmployeeID;

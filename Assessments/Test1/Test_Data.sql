Create table Department
(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(255) NOT NULL
);


Create Table Employee
(
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255),
	DepartmentID INT,
	isactive BIT,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

Create Table EmployeeDetails
(
	EmployeeDetailsID INT PRIMARY KEY,
	EmployeeID INT,
	BirthDate DATE,
	JoiningDate DATE,
	Salary DECIMAL(10,2),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


INSERT INTO Department(DepartmentID, DepartmentName)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');


INSERT INTO Employee(EmployeeID, FirstName, LastName, DepartmentID)
VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Bob', 'Johnson', 1),
(4, 'Alice', Null, 3),
(5, 'Sam', Null, 2),
(6, 'Liam', 'Smith', 2),
(7, 'Clark', Null, 1),
(8, 'RK', Null, 1),
(9, 'Kim', Null, 3),
(10, 'Heams', Null, 3),
(11, 'Tony', 'Johnson', 2)


INSERT INTO EmployeeDetails (EmployeeDetailsID, EmployeeID, BirthDate, JoiningDate, Salary) 
VALUES
(100, 1, '1990-05-15', '2015-03-20', 60000.00),
(101, 2, '1985-08-21', '2010-11-10', null),
(102, 3, '1988-12-02', '2018-06-05', 55000.00),
(103, 5, '1992-04-30', '2017-09-15', null),
(104, 6, null, '2017-09-15', 65000.00),
(105, 7, '1992-04-30', '2017-09-15', 65000.00),
(106, 8, '1992-04-30', null, 65000.00);

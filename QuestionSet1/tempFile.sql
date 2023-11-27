CREATE TABLE Employees (
  Id INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Department VARCHAR(100) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);

Select * from Employees;
Select * from Project;

CREATE TABLE Project (
    ProjectId INT PRIMARY KEY IDENTITY(1, 1),
    Title VARCHAR(200) NOT NULL,
    ClientId INT,
    EmployeeId INT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);
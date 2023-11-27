-- CRUD

CREATE TABLE Gender
(
  G_ID INT PRIMARY KEY IDENTITY(1,1),
  G_type VARCHAR(50)
);

--Create Department table
CREATE TABLE Department
(
  D_ID INT PRIMARY KEY IDENTITY(1,1),
  D_Name VARCHAR(100)
);

DROP TABLE IF EXISTS Gender;
DROP TABLE IF EXISTS Department;





-- Create 
INSERT INTO Gender VALUES('Male');
INSERT INTO Gender VALUES('Female');
INSERT INTO Gender VALUES('Unknown');

INSERT INTO Department VALUES('IT');
INSERT INTO Department VALUES('HR');
INSERT INTO Department VALUES('HR');
INSERT INTO Department VALUES('HR');
INSERT INTO Department VALUES('HR');

INSERT INTO Department VALUES('Payroll');

-- Read
SELECT * FROM Gender;
SELECT * FROM Department;

-- Update
UPDATE Gender
SET	 G_type  = 'First'
WHERE G_type = 'Female';

UPDATE Department 
SET D_Name = 'RR'
WHERE D_Name = 'HR';


-- Delete
DELETE FROM Department
WHERE D_Name = 'HR';

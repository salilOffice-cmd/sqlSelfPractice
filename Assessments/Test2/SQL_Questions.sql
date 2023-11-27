/*****************************************************************************
                            SQL Assignment 
*****************************************************************************/

CREATE TABLE Customers (
	customer_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5),
	Isactive bit 
);


INSERT INTO Customers (first_name, last_name, phone, email, street, city, state, zip_code, Isactive)
VALUES
('John', 'Doe', '123-456-7890', 'john.doe@example.com', '123 Main St', 'New York', 'New York', '12345', 1),
('Jane', 'Smith', '987-654-3210', 'jane.smith@example.com', '456 Oak St', 'Los Angeles', 'California', ' ', 1),
('Bob', 'Johnson', '111-222-3333', 'bob.johnson@example.com', '789 Pine St', 'City3', 'State3', NULL, 0),
('Alice', 'Williams', '555-666-7777', 'alice.williams@example.com', '321 Cedar St', 'San Diego', '', ' ', 1),
('Charlie', 'Brown', '999-888-7777', 'charlie.brown@example.com', '567 Birch St', 'Los Angele', 'Texas', NULL, 0),
('Eva', 'Martinez', '333-444-5555', 'eva.martinez@example.com', '876 Maple St', 'Houston', 'Texas', '87654', 1),
('David', 'Davis', '777-888-9999', 'david.davis@example.com', '234 Elm St', 'New York', NULL, '34567', 0),
('Grace', 'Jones', '444-555-6666', 'grace.jones@example.com', '678 Walnut St', 'Houston', 'Texas', NULL, 1),
('Frank', 'White', '666-777-8888', 'frank.white@example.com', '987 Pine St', 'New York', NULL, '23456', 1),
('Helen', 'Lee', '222-333-4444', 'helen.lee@example.com', '123 Oak St', 'Austin', 'Texas', '78901', 0),
('Ram', 'Mathur', '1234567897', 'Ram.doe@example.com', '123 Main St', 'Nagpur', 'Maharashtra', '12345', 1),
('Sumit', 'Agrwal', '9638527412', 'Sumit.Agrwal@example.com', '456 Oak St', 'Wardha', NULL, '54321', 1),
('Arjun', 'Rathor', '4651234567', 'Arjun.Rathor@example.com', '789 Pine St', 'Waranasi', 'Uttar Pradesh', NULL, 0),
('Kiran', 'Thakur', '7896541234', 'Kiran.Thakur@example.com', '321 Cedar St', 'Nagpur', 'Maharashtra', '98765', 1),
('Ankita', 'Mankar', '4568521478', 'Ankita.Mankar@example.com', '567 Birch St', 'Nagpur', Null, '', 0),
('Ashish', 'Kumar', '9517532456', 'Ashish.Kumar@example.com', '876 Maple St', 'Delhi', NULL, '87654', 1),
('Ravi', 'Kumar', '8965745632', 'Ravi.Kumar@example.com', '234 Elm St', 'Karnataka', 'Bangalore', NULL, 0),
('Krish', 'Mathur', '7485961335', 'Krish.Mathur@example.com', '678 Walnut St', 'Hyderabad', NULL, '', 1),
('Ali', 'Akthar', '6598745632', 'Ali.Akthar@example.com', '987 Pine St', 'Ahmedabad', 'Gujarat', '', 1),
('Lee', 'Lee', '56897845123', 'Lee.lee@example.com', '123 Oak St', 'Chennai', NUll, '78901', 0);

--------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE Orders (
    order_id INT IDENTITY(1, 1) PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Insert sample data into Orders table
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2023-11-01', 150.00),
(2, '2023-11-02', 200.50),
(3, '2023-11-03', 75.20),
(18, '2023-10-23', 200.00),
(19, '2023-10-25', 200.50),
(3, '2023-10-14', 750.20),
(11, '2022-09-01', 900.00),
(15, '2022-08-02', 500.50),
(14, '2022-07-03', 750.20),	
(18, '2020-05-01', 150.00),
(18, '2020-04-02', 200.50),
(19, '2018-02-03', 75.20),	
(10, '2023-12-01', 150.00),
(20, '2023-09-02', 200.50),
(13, '2023-08-12', 75.20),
(3, '2023-05-11', 150.00),
(18, '2023-03-12', 200.50),
(19, '2023-02-13', 75.20),	
(3, '2023-08-25', 150.00),
(18, '2023-07-24', 200.50),
(19, '2023-05-23', 75.20)	


Create table Payment_Method
(
Payment_MethodID int primary key,
MethodName varchar(40)
)

insert into Payment_Method (Payment_MethodID,MethodName)
            values (1001,'Credit Card'),(1562,'PayPal'),(1520,'Credit Card'),(3652,'Debit Card'),(456,'PhonePay'),(7896,'.')


CREATE TABLE Payments (
    payment_id INT IDENTITY(1, 1) PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    Payment_MethodID VARCHAR(50)
);


-- Insert sample data into Payments table
INSERT INTO Payments (customer_id, payment_methodID)
VALUES
(1,  456),
(2, 1520),
(3, 7896),
(10,  1520),
(11, 1562),
(13, 7896),
(14,  456),
(15, 7896),
(18,1562),
(19,  7896),
(20, 1001)


/***************************************************************************/
    --                       Questions 
/**************************************************************************


1]  Write a query to display the customer's first name, last name, order ID, order date, total amount, payment ID, 
    and payment method for each order. order the results by order date in descending order. (1)

2]  Write a query to display the customer's first name, last name, email, order ID, order date, total amount, payment ID, 
    and payment method for each order. filter the results to show only the customers who have placed an order in 2023 and have an active status.(1)

3]  Write a query to display the customer's first name, last name, phone, order ID, order date, total amount, 
    payment ID, and payment method for each order.show only the orders that have a payment method of Credit Card or Debit Card. (1)

4]  Write a query to display the customer's first name, last name, city, state, order ID, order date, total amount, 
    payment ID, and payment method for each order.handle the null values by replacing them with 'N/A'. (1)

5]  Write a query to display the customer's first name, last name, order ID, order date, total amount, payment ID,
    payment method, and a computed column that shows the customer satisfaction based on the total amount and the payment method. 
    The customer satisfaction should be 'High' if the total amount is greater than 500 and the payment method is PayPal or G-Pay, 
    'Medium' if the total amount is between 200 and 500 and the payment method is Credit Card or Debit Card, 
    and 'Low' if the total amount is less than 200 and the payment method is PhonePay(case). (1)
  

6] Find the customer who made the latest order (by order date). display Customer Data (1)
7] Write down query which display count of orders each customer has made?(gb)  (1)



8] Create Stored Procedure which display below columns
   Customer_id,first_name,last_name,email,city,zip_code,total_amount,MethodName,Payment_id
   data should be filter based on @CustomerName,@PaymentMethodName (User can pass either CustomerName or PaymentMethodName)
   
   Note :- Use temp table for one filter and  CTE for another filter (2)
   

9] Create Stored Procedure which display below column 
   Customer_id,first_name,last_name,email,city,zip_code,total_amount,MethodName,Payment_id

   Note :- Procedure accept @customerID parameters and check if ID exists or not if exists it will display 
           data related to that ID and if not the it must gives message 'Invalid CustomerID'

		   Handle null data if any (2)

10]  Create Procedure which takes @customer_id and Deletes the specified customer along with their associated orders (2)

11]  Create Stored Procedure which display folowing details(declare)
     count of Customers with most orders
	 count of customers used 'Debit Card','PhonePay' 
	 count of customer who belongs to 'New York' and 'Maharashtra' state uses 'Credit Card' payment method 
	 count of Active Customer having entries into order table (2)
	 

12]  Create a stored procedure named InsertCustomer that takes parameters for 
     first_name, last_name, phone, email, street, city, state, zip_code, 
	 and Isactive, 
	 and inserts a new record into the Customers table. 
	 Ensure that the Isactive parameter is set to 1 by default if not provided. (2)



Please Excute Below Table and Answer the Questions  */

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary)
VALUES
(1, 'John Doe', 'IT', 75000.00),
(2, 'Jane Smith', 'HR', 60000.00),
(3, 'Bob Johnson', 'Finance', 80000.00),
(4, 'John Doe', 'IT', 75000.00),  
(5, 'Jane Smith', 'HR', 60000.00),  
(6, 'Bob Johnson', 'Finance', 80000.00),
(7, 'Arun', 'Finance', 1000.00),
(8, 'Bob Johnson', 'Finance', 80000.00),
(9, 'Bob Johnson', 'Finance', 80000.00),
(10, 'Arun', 'Finance', 1000.00),
(11, 'Bob Johnson', 'Finance', 80000.00),
(12, 'Arun', 'Finance', 1000.00),
(13, 'John Doe', 'IT', 75000.00),
(14, 'Bob Johnson', 'Finance', 80000.00),
(15, 'Arun', 'Finance', 1000.00),
(16, 'Bob Johnson', 'Finance', 80000.00),
(17, 'John Doe', 'IT', 75000.00),
(18, 'Bob Johnson', 'Finance', 80000.00),
(19, 'Bob Johnson', 'Finance', 80000.00),
(20, 'John Doe', 'IT', 75000.00)

/*

13] Write down query to copy all data into another table with one extra column called 'CopyTable' with some hard-coaded value (1)
14] Write down query to remove duplicate data using CTE (Row_n) (2)
15] Write down query to display [YourName/DOB/YearofPassing/City] ex :- Sam/10-11-2023/2023/New York (1)
    also write down query to display details in following way

	My Details    -- Column Name         My Details
	Name                                  ABC
	Favourite Technology                  .Net
	Favourite Game                        Cricket
	Favourite Player                      Dravid
	Dream Company                         SmartData
	etc.                                    

---------------------------     ALL THE BEST      --------------------------*/
	


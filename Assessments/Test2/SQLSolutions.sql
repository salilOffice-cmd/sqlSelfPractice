--create database sql_assessmentTest2;


--1]  Write a query to display the customer's first name, last name, order ID, order date, total amount, payment ID, 
--    and payment method for each order. order the results by order date in descending order. (1)

Select     Customers.first_name,
		   Customers.last_name,
		   Orders.order_id, 
		   Orders.order_date, 
		   Orders.total_amount,
		   Payments.payment_id,
		   Payment_Method.MethodName
From       Customers
Join       Orders
On         Customers.customer_id = Orders.customer_id
Join       Payments
On         Customers.customer_id = Payments.customer_id
Join       Payment_Method
On         Payments.Payment_MethodID = Payment_Method.Payment_MethodID
Order By   Orders.order_date DESC



-- 2] Write a query to display the customer's first name, last name, email, order ID, order date, total amount, payment ID, 
-- and payment method for each order.
-- filter the results to show only the customers who have placed an order in 2023 and have an active status.(1)
Select  Customers.first_name,
		Customers.last_name,
		Customers.email,
		Orders.order_id, 
		Orders.order_date, 
		Orders.total_amount,
		Payments.payment_id,
		Payment_Method.MethodName
From    Customers
Join    Orders
On      Customers.customer_id = Orders.customer_id
Join    Payments
On      Customers.customer_id = Payments.customer_id
Join    Payment_Method
On      Payments.Payment_MethodID = Payment_Method.Payment_MethodID
Where   Year(Orders.order_date) = 2023 AND Customers.Isactive = 1;


--3]  Write a query to display the customer's first name, last name, phone, order ID, order date, total amount, 
--    payment ID, and payment method for each order.show only the orders that have a payment method of Credit Card or Debit Card. (1)
Select  Customers.first_name,
		Customers.last_name,
		Customers.phone,
		Orders.order_id, 
		Orders.order_date, 
		Orders.total_amount,
		Payments.payment_id,
		Payment_Method.MethodName
From    Customers
Join    Orders
On      Customers.customer_id = Orders.customer_id
Join    Payments
On      Customers.customer_id = Payments.customer_id
Join    Payment_Method
On      Payments.Payment_MethodID = Payment_Method.Payment_MethodID
Where   Payment_Method.MethodName IN ('Credit Card','Debit Card');


--4]  Write a query to display the customer's first name, last name, city, state, order ID, order date, total amount, 
--    payment ID, and payment method for each order.handle the null values by replacing them with 'N/A'. (1)

Select  Customers.first_name,
		Customers.last_name,
		Customers.city,
		ISNULL(Customers.[state], 'N/A') as [state],
		Orders.order_id, 
		Orders.order_date, 
		Orders.total_amount,
		Payments.payment_id,
		Payment_Method.MethodName
From    Customers
Join    Orders
On      Customers.customer_id = Orders.customer_id
Join    Payments
On      Customers.customer_id = Payments.customer_id
Join    Payment_Method
On      Payments.Payment_MethodID = Payment_Method.Payment_MethodID



--5]  Write a query to display the customer's first name, last name, order ID, order date, total amount, payment ID,
--    payment method, and a computed column that shows the customer satisfaction based on the total amount and the payment method. 
--    The customer satisfaction should be 'High' if the total amount is greater than 500 and the payment method is PayPal or G-Pay, 
--    'Medium' if the total amount is between 200 and 500 and the payment method is Credit Card or Debit Card, 
--    and 'Low' if the total amount is less than 200 and the payment method is PhonePay(case). (1)

Select  Customers.first_name,
		Customers.last_name,
		Orders.order_id, 
		Orders.order_date, 
		Orders.total_amount,
		Payments.payment_id,
		Payment_Method.MethodName,
		Case
			When (Orders.total_amount > 500) AND Payment_Method.MethodName IN ('PayPal', 'G-Pay') Then 'High'
			When (Orders.total_amount Between 200 AND 500) AND Payment_Method.MethodName IN ('Credit Card', 'Debit Card') Then 'Medium'
			When (Orders.total_amount < 200) AND Payment_Method.MethodName IN ('PhonePay') Then 'Low'
		End as Satisfaction
From    Customers
Join    Orders
On      Customers.customer_id = Orders.customer_id
Join    Payments
On      Customers.customer_id = Payments.customer_id
Join    Payment_Method
On      Payments.Payment_MethodID = Payment_Method.Payment_MethodID


--6] Find the customer who made the latest order (by order date). display Customer Data (1)
Select    Top(1)
		  Customers.*,
		  Orders.order_date
From      Customers
Join      Orders
On        Customers.customer_id = Orders.customer_id
Order By  Orders.order_date DESC


--7] Write down query which display count of orders each customer has made?(gb)  (1)
Select      Orders.customer_id,
		    Count(*) as OrdersCount
From        Customers
Join        Orders
On          Customers.customer_id = Orders.customer_id
Group By    Orders.customer_id


-- 8] to 12] Different files for each stored procedure


-- 13] Write down query to copy all data into another table with one extra column called 'CopyTable' with some hard-coaded value (1)
CREATE TABLE EmployeesCopyTable (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
	Isactive bit DEFAULT 1
);

Insert Into    EmployeesCopyTable(EmployeeID, EmployeeName, Department, Salary)
Select         EmployeeID,
	           EmployeeName,
               Department,
               Salary 
from		   Employees;

Select * from EmployeesCopyTable


-- 14] Write down query to remove duplicate data using CTE (Row_n) (2)
;With RemoveDuplicate_CTE AS
(
	Select EmployeeID,
		   ROW_NUMBER() Over (Partition By EmployeeName,
										   Department,
										   Salary 
							  Order by     EmployeeName) as RowNumber
	From Employees
)
Delete From  Employees
Where        EmployeeID IN (Select EmployeeID
							From   RemoveDuplicate_CTE
							Where  RowNumber > 1)




--15] Write down query to display [YourName/DOB/YearofPassing/City] ex :- Sam/10-11-2023/2023/New York (1)
--    also write down query to display details in following way

--	My Details    -- Column Name         My Details
--	Name                                  ABC
--	Favourite Technology                  .Net
--	Favourite Game                        Cricket
--	Favourite Player                      Dravid
--	Dream Company                         SmartData
--	etc.   

Select 'Salil/21-05-2001/2023/Nagpur' as Details

Select 'Name', 'Salil'
Union
Select 'Favourite Technology', 'Blockchain'
Union
Select 'Favourite Game', 'Chess'
Union
Select 'Favourite Player', 'Magnus Carlsen'
Union
Select 'Dream Company', 'SmartData'




Select * from Employees
Select * From Customers;
Select * From Orders;
Select * From Payments;
Select * From Payment_Method;


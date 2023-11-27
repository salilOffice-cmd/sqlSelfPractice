--  8] Create Stored Procedure which display below columns
--   Customer_id,first_name,last_name,email,city,zip_code,total_amount,MethodName,Payment_id
--   data should be filter based on @CustomerName,@PaymentMethodName (User can pass either CustomerName or PaymentMethodName)
   
--   Note :- Use temp table for one filter and  CTE for another filter (2)



/*****************************************************************************************/

/*
Title:			spCustomers_Orders_Payments_PaymentMethod_Select
Creator:		Salil Deogade

Purpose: 		To filter data based on CustomerName or PaymentMethodName
Functionality:	Joined Customers, Orders, Payment, Payment_Method tables
Created:		
Applications:	

Comments:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example:		exec spCustomers_Orders_Payments_PaymentMethod_Select @CustomerName = 'John'
				exec spCustomers_Orders_Payments_PaymentMethod_Select @PaymentMethodName = 'Credit Card'
		        




Output:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Return Values:	
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modifications:

Date          Developer        Description
----------  --------------	--------------------------------------------------------------------------------------------------------------------
24/11/2023    Salil Deogade     Created the stored procedure
*/



Alter Procedure spCustomers_Orders_Payments_PaymentMethod_Select @CustomerName varchar(255) = null,
																 @PaymentMethodName varchar(255) = null
AS 
Begin
	if @CustomerName is not null
	begin

		;With showAllTableData_CTE AS
		(
			Select  Customers.customer_id,
					Customers.first_name,
					Customers.last_name,
					Customers.email,
					Customers.city,
					Customers.zip_code,
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
		)
		Select * 
		from   showAllTableData_CTE
		Where  first_name = @CustomerName

	end


	if @PaymentMethodName is not null
	begin
		
		Create Table #tempQueryByPaymentMethodList ( customer_id int,
													 first_name varchar(255),
													 last_name varchar(255),
													 email varchar(255),
													 city varchar(50),
													 zip_code varchar(5),
													 total_amount DECIMAL(10, 2),
													 payment_id int,
													 MethodName varchar(50))

		
		Insert Into    #tempQueryByPaymentMethodList
		Select         Customers.customer_id,
				       Customers.first_name,
				       Customers.last_name,
				       Customers.email,
				       Customers.city,
				       Customers.zip_code,
				       Orders.total_amount,
				       Payments.payment_id,
				       Payment_Method.MethodName
		From           Customers
		Join           Orders
		On             Customers.customer_id = Orders.customer_id
		Join           Payments
		On             Customers.customer_id = Payments.customer_id
		Join           Payment_Method
		On             Payments.Payment_MethodID = Payment_Method.Payment_MethodID


		Select  *
		From    #tempQueryByPaymentMethodList
		Where   MethodName = @PaymentMethodName


	end

End


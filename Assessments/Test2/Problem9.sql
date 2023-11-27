--9] Create Stored Procedure which display below column 
--   Customer_id,first_name,last_name,email,city,zip_code,total_amount,MethodName,Payment_id

--   Note :- Procedure accept @customerID parameters and check if ID exists or not if exists it will display 
--           data related to that ID and if not the it must gives message 'Invalid CustomerID'

--		   Handle null data if any (2)



/*****************************************************************************************/

/*
Title:			spCustomers_Orders_Payments_PaymentMethod_Select_ByCustomerID
Creator:		Salil Deogade

Purpose: 		To filter data based on customerID
Functionality:	Joined Customers, Orders, Payment, Payment_Method tables
Created:		
Applications:	

Comments:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example:		exec spCustomers_Orders_Payments_PaymentMethod_Select_ByCustomerID @customerID = 222
		        




Output:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Return Values:	
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modifications:

Date          Developer        Description
----------  --------------	--------------------------------------------------------------------------------------------------------------------
24/11/2023    Salil Deogade     Created the stored procedure
*/


Alter Procedure spCustomers_Orders_Payments_PaymentMethod_Select_ByCustomerID @customerID int
AS 
Begin
	
		Declare @CustomerExists int = 0;
		Select @CustomerExists = Count(*)
		From Customers
		Where customer_id = @customerID

		if @CustomerExists = 0
		begin 
			Select 'Invalid CustomerID' as Response
			return;
		end

		if @CustomerExists <> 0
		begin

			Select  Customers.customer_id,
					Customers.first_name,
					Customers.last_name,
					Customers.email,
					Customers.city,
					ISNULL(Customers.zip_code, 'N/A') as zip_code,
					Orders.total_amount,
					IIF(Payment_Method.MethodName = '.', 'N/A', Payment_Method.MethodName),
					Payments.payment_id
			From    Customers
			Join    Orders
			On      Customers.customer_id = Orders.customer_id
			Join    Payments
			On      Customers.customer_id = Payments.customer_id
			Join    Payment_Method
			On      Payments.Payment_MethodID = Payment_Method.Payment_MethodID
			Where   Customers.customer_id = @customerID

		end

		

End


--10]  Create Procedure which takes @customer_id and Deletes the specified customer along with their associated orders (2)



/*****************************************************************************************/

/*
Title:			spCustomers_Orders_Payments_PaymentMethod_Select_ByCustomerID
Creator:		Salil Deogade

Purpose: 		Deletes the specified customer along with their associated orders
Functionality:	Delete record from Customers and Orders and Payment as well
Created:		
Applications:	

Comments:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example:		exec spCustomers_Orders_Delete @customerID = 1
		        




Output:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Return Values:	
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modifications:

Date          Developer        Description
----------  --------------	--------------------------------------------------------------------------------------------------------------------
24/11/2023    Salil Deogade     Created the stored procedure
*/


Alter Procedure spCustomers_Orders_Delete @customerID int
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

			Delete From Customers
			Where customer_id = @customerID

			Delete From Orders
			Where customer_id = @customerID

			Delete From Payments
			Where customer_id = @customerID



		end

		

End


--11]  Create Stored Procedure which display folowing details(declare)
--     count of Customers with most orders
--	 count of customers used 'Debit Card','PhonePay' 
--	 count of customer who belongs to 'New York' and 'Maharashtra' state uses 'Credit Card' payment method 
--	 count of Active Customer having entries into order table (2)



/*****************************************************************************************/

/*
Title:			spCustomers_Orders_Payments_PaymentMethod_Select_ByCustomerID
Creator:		Salil Deogade

Purpose: 	
Functionality:	
Created:		
Applications:	

Comments:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example:		exec spGiveCountForFourConditions
		        




Output:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Return Values:	
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modifications:

Date          Developer        Description
----------  --------------	--------------------------------------------------------------------------------------------------------------------
24/11/2023    Salil Deogade     Created the stored procedure
*/


Alter Procedure spGiveCountForFourConditions
AS 
Begin

		Declare @MostOrders_CustomerCount int;
	    Declare @DebitCardPhonePay_CustomerCount int;
	    Declare @NewYorkMaha_UsesCreditCard_CustomerCount int;
	    Declare @ActiveCustomersCount int;
		
		---  count of Customers with most orders
		With MostOrders_CTE1 AS
		(
			Select      Orders.customer_id,
						Count(*) as CountOrders
			From        Customers
			Join        Orders
			On          Customers.customer_id = Orders.customer_id
			Group By    Orders.customer_id	
		),
		MostOrders_CTE2 AS
		(
			Select Max(CountOrders) as MaxCount
			From  MostOrders_CTE1
		)
		Select @MostOrders_CustomerCount = Count(*)
		From   MostOrders_CTE1
		Where  CountOrders = (Select MaxCount from MostOrders_CTE2)



		-- 2
		Select  @DebitCardPhonePay_CustomerCount = Count(*)
		From    Customers
		Join    Payments
		On      Customers.customer_id = Payments.customer_id
		Join    Payment_Method
		On      Payments.Payment_MethodID = Payment_Method.Payment_MethodID
		Where   Payment_Method.MethodName IN ('Debit Card','PhonePay' );


		-- 3
		Select  @NewYorkMaha_UsesCreditCard_CustomerCount = Count(*)
		From    Customers
		Join    Payments
		On      Customers.customer_id = Payments.customer_id
		Join    Payment_Method
		On      Payments.Payment_MethodID = Payment_Method.Payment_MethodID
		Where   Customers.state IN ('New York' , 'Maharashtra' ) AND Payment_Method.MethodName = 'Credit Card';


		-- 4 
		Select     @ActiveCustomersCount = Count(*)
		From       Customers
		Join       Orders
		On         Customers.customer_id = Orders.customer_id



		Select  @MostOrders_CustomerCount as MostOrders_CustomerCount,
			    @DebitCardPhonePay_CustomerCount as DebitCardPhonePay_CustomerCount,
	            @NewYorkMaha_UsesCreditCard_CustomerCount as  NewYorkMaha_UsesCreditCard_CustomerCount,
	            @ActiveCustomersCount as ActiveCustomersCount;
End


--12]  Create a stored procedure named InsertCustomer that takes parameters for 
--     first_name, last_name, phone, email, street, city, state, zip_code, 
--	 and Isactive, 
--	 and inserts a new record into the Customers table. 
--	 Ensure that the Isactive parameter is set to 1 by default if not provided. (2)


/*****************************************************************************************/

/*
Title:			spCustomers_Insert
Creator:		Salil Deogade

Purpose: 		Inserts Customers into Table
Functionality:	
Created:		
Applications:	

Comments:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example:		exec spCustomers_Insert @first_name = 'Salil',
								        @last_name = 'Deogade',
								        @phone = 38408340343,
								        @email = 'salil.deogade@gmail.com',
								        @street = 'Medical Chowk',
								        @city = 'Nagpur',
								        @state = 'MH',
								        @zip_code = '009'
								        
		        




Output:		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Return Values:	
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modifications:

Date          Developer        Description
----------  --------------	--------------------------------------------------------------------------------------------------------------------
24/11/2023    Salil Deogade     Created the stored procedure
*/


Create Procedure spCustomers_Insert @first_name VARCHAR (255),
									@last_name VARCHAR (255),
									@phone VARCHAR (25),
									@email VARCHAR (255),
									@street VARCHAR (255),
									@city VARCHAR (50),
									@state VARCHAR (25),
									@zip_code VARCHAR (5),
									@Isactive bit = 1
AS 
Begin
	
	Insert Into Customers Values
	(
		@first_name,
		@last_name,
		@phone,
		@email,
		@street,
		@city ,
		@state,
		@zip_code ,
		@Isactive 
	);
	
End


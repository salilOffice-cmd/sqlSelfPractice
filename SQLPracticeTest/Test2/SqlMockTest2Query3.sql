-- 1] Create a stored procedure that takes input parameters 
-- for a new patient's first name, last name, age, gender,
-- and contact number, and inserts a new patient into the Patients table.

select * from Patients;
drop procedure spAddPatient

/*
	EXEC spAddPatient @PatientID     = 6,
					  @FirstName     = 'Salil',
					  @LastName      = 'Deogade',
					  @Age           = 23,
					  @Gender        = 'Male',
					  @ContactNumber = '9370311231'
*/


Create Procedure spAddPatient @PatientID int,
						      @FirstName varchar(50),
							  @LastName varchar(50),
							  @Age int,
							  @Gender varchar(10),
							  @ContactNumber varchar (15)
As 
Begin 
	
	Declare @PatientExists INT;

	Select @PatientExists = COUNT(*)
    From   Patients
    Where  PatientID = @PatientID;

	If @PatientExists > 0
	begin
		Select concat('PatientID ', @PatientID, ' already exists')
		Return;  -- stop execution of the procedure
	end

	Insert Into Patients Values
	(
		@PatientID,
		@FirstName,
		@LastName,
		@Age,
		@Gender,
		@ContactNumber
	)

End






-- Create a Stored Procedure to Schedule an Appointment:
-- 2] Develop a stored procedure that allows scheduling appointments.
-- It should accept parameters for patient ID, doctor ID, appointment date,
-- appointment time, and reason, and inserts a new appointment 
-- into the Appointments table.

Declare @CurrentDate Date = getDate();
EXEC spAddAppointment @AppointmentID     = 1005,
					  @PatientID         = 1,
					  @DoctorID          = 103,
					  @AppointmentDate   = @CurrentDate,
					  @AppointmentTime   = '13:30:00',
					  @AppointmentReason = 'Work Stress'
					  


Create Procedure spAddAppointment @AppointmentID INT,
								  @PatientID INT,
								  @DoctorID INT,
								  @AppointmentDate DATE,
								  @AppointmentTime TIME,
								  @AppointmentReason VARCHAR(100)
As 
Begin 
	


	-- Checking existence of given patientID
	Declare @PatientExists INT;

	Select @PatientExists = COUNT(*)
    From   Patients
    Where  PatientID = @PatientID;

	If @PatientExists = 0
	begin
		Select concat('Patient ', @PatientID, ' not exists')
		Return;
	end



	-- Checking existence of given doctorID
	Declare @DoctorExists INT;

	Select @DoctorExists = COUNT(*)
    From   Doctors
    Where  DoctorID = @DoctorID;

	If @DoctorExists = 0
	begin
		Select concat('Doctor ', @AppointmentID, ' not exists')
		Return;
	end



	-- Checking existence of given appointmentID
	Declare @AppointmentExists INT;

	Select @AppointmentExists = COUNT(*)
    From   Appointments
    Where  AppointmentID = @AppointmentID;

	If @AppointmentExists > 0
	begin
		Select concat('Appointment ', @AppointmentID, ' already exists')
		Return;
	end



	Insert Into Appointments Values
	(
		@AppointmentID,
		@PatientID ,
		@DoctorID ,
		@AppointmentDate,
		@AppointmentTime,
		@AppointmentReason
	)

End






-- Create a Stored Procedure to List Patients by Age Range:
-- 3] Design a stored procedure that takes minimum and
--    maximum age as input parameters and returns a list of patients within that age range.

/*
	exec spGetPatientsByAge @MinAge = 5,
							@MaxAge = 30
*/
Create Procedure spGetPatientsByAge @MinAge int,
									@MaxAge int
As
Begin
	Select  *
	From    Patients
	Where   Age Between @MinAge And @MaxAge

End






--Create a Stored Procedure to Update Doctors Information:
--4] Develop a stored procedure that updates a doctor's contact number based on the doctor's ID.

/*
	drop procedure spUpdateDoctorNumber
	exec spUpdateDoctorNumber @DoctorID = 111,
							  @NewContactNumber = '77043023983'
*/
Create Procedure spUpdateDoctorNumber @DoctorID int,
									  @NewContactNumber varchar(15)
As
Begin
	
	-- Checks if doctor with the given id exists
	Declare @DoctorExists INT;

	Select @DoctorExists = COUNT(*)
    From   Doctors
    Where  DoctorID = @DoctorID;

	If @DoctorExists = 0
	begin
		Select concat('Doctor ', @DoctorID, ' not exists')
		Return;
	end


	Update Doctors
	Set    ContactNumber = @NewContactNumber
	Where  DoctorID = @DoctorID

End





-- Create a Stored Procedure to Delete Appointments by Date:
-- 5] Build a stored procedure that accepts an appointment 
--    date as a parameter and deletes all appointments that match the specified date.
/*
	drop procedure spDeleteAppointmentsByDate
	exec spDeleteAppointmentsByDate @Date = '2023-11-07'
*/
Create Procedure spDeleteAppointmentsByDate @Date Date
As
Begin
	Delete From Appointments
	Where AppointmentDate = @Date
End



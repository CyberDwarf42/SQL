USE ChamplainCharityLLC
GO

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'pImportVolunteerContactInformation')
BEGIN
DROP PROCEDURE dbo.pImportVolunteerContactInformation
END;

GO
CREATE PROCEDURE [dbo].[pImportVolunteerContactInformation] 
	-- Add the parameters for the stored procedure here
	@PersonID int,
	@ContactEmail NVARCHAR(30), 
	@VolunteerType int, 
	@ContactPersonID int,
	@IsActive bit, 
	@ModifiedBy Name,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@SUCCESS BIT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY 
BEGIN TRANSACTION

INSERT INTO Volunteer.VolunteerContactInformation 
	(ContactPersonID,
	ContactFirstName,
	ContactLastName,
	ContactAddress1,
	ContactEmail,
	ContactCellPhone,
	VolunteerTypeID,
	IsActive,
	ModifiedBy,
	ModifiedDate)

SELECT
	ContactPersonID,
	FirstName,
	LastName,
	AddressLine1,
	ContactEmail,
	PhoneNumber,
	VolunteerType,
	IsActive,
	ModifiedBy,
	SYSDATETIME()
	 
FROM dbo.GetInfoList(
	@PersonID, 
	@ContactEmail, 
	@VolunteerType, 
	@ContactPersonID, 
	@IsActive, 
	@ModifiedBy)

SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1
COMMIT TRANSACTION
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @SUCCESS = 0;
	--I am using Print Error_Message as I was having issues with one of the included SPs
	--it was printing errors, but had next to no information on what was causing the error,
	--which made figuring it out a mess.
	PRINT ERROR_MESSAGE();

END CATCH
END
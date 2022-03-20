USE ChamplainCharityLLC
GO
--This procedure is called when the system wants to just enter data in a particular week for a person.
--Each week has a specific ID, this one just takes that ID and generates a day time ID and inserts that into 
--the Jobs table. This allows for a volunteer to work multiple days in a week, but still under the same weekID. 
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'pInsertDailyWorkHistory')
BEGIN
DROP PROCEDURE dbo.pInsertDailyWorkHistory
END;

GO

CREATE PROCEDURE dbo.pInsertDailyWorkHistory 
@VolunteerScheduleWeekID int, 
@DayOfWeek int, 
@AvailableBeginTime time(7), 
@AvailableEndTime time(7), 
@IsNoShow bit, 
@ActualHoursTotal numeric(18,0),
@Job int, 
@ModifiedBy NVARCHAR(50),
@Error NVarchar(50) Output,
@ErrorNo int output,
@SUCCESS BIT OUTPUT
	
AS 

SET NOCOUNT ON;

DECLARE

@ErrNo int =0,
@ErrMsg Nvarchar(50)= ''

BEGIN TRY

BEGIN TRANSACTION	
BEGIN
--Ditto previous comment. 
EXEC dbo.pInsertVolunteerScheduleDayTime @VolunteerScheduleWeekID, @DayOfWeek, 
	@AvailableBeginTime, @AvailableEndTime, @IsNoShow, @ActualHoursTotal, @ModifiedBy
--If there is an error, it breaks.
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1

END

BEGIN 

EXEC dbo.pInsertVolunteerJobs @VolunteerScheduleDayTimeID = @@IDENTITY, @Job = @Job, @ModifiedBy = @ModifiedBy
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1

COMMIT TRANSACTION
END
END TRY
--Rolls the transaction back if there is an error. 
BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @SUCCESS = 0;
	--I am using Print Error_Message as I was having issues with one of the included SPs
	--it was printing errors, but had next to no information on what was causing the error,
	--which made figuring it out a mess.
	PRINT ERROR_MESSAGE();

END CATCH;
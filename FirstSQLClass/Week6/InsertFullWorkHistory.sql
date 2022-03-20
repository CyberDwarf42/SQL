USE ChamplainCharityLLC
GO

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'pInsertFullWorkHistory')
BEGIN
DROP PROCEDURE dbo.pInsertFullWorkHistory
END;

GO

CREATE PROCEDURE dbo.pInsertFullWorkHistory 
@VolunteerPersonID int, 
@Month int, 
@Week int, 
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
--This will enter data into all three Volunteer Time Tables
EXEC dbo.pInsertVolunteerScheduleMonth @VolunteerPersonID, @Month, @ModifiedBy
--If there is an error, it breaks. 
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1


END

BEGIN
--Currently using @@Identity as it is the only way I can figure out how to return the identity from the previous insert.
--I am aware it only works for one insert at a time. 
EXEC dbo.pInsertVolunteerScheduleWeek @VolunteerScheduleMonthID = @@IDENTITY, @Week = @Week, @ModifiedBy = @Modifiedby
--If there is an error, it breaks.
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1


END

BEGIN
--Ditto previous comment. 
EXEC dbo.pInsertVolunteerScheduleDayTime @VolunteerScheduleWeekID = @@IDENTITY, @DayOfWeek = @DayOfWeek, 
	@AvailableBeginTime = @AvailableBeginTime, @AvailableEndTime = @AvailableEndTime, @IsNoShow = @IsNoShow,
	@ActualHoursTotal = @ActualHoursTotal, @ModifiedBy = @ModifiedBy
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
USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertVolunteerScheduleDayTime')
BEGIN
DROP PROCEDURE dbo.InsertVolunteerScheduleDayTime;
END;

GO
--Inserts Data into the VolunteerScheduleDayTime Table. 
CREATE PROCEDURE dbo.InsertVolunteerScheduleDayTime @VolunteerScheduleWeekID INT, @DayOfWeek INT, @AvailableBeginTime TIME(7),
	@AvailableEndTime TIME(7), @IsNoShow BIT, @ActualHoursTotal NUMERIC(18,0), @ModifiedBy NAME

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerScheduleDayTime
(VolunteerScheduleWeekID,
[DayOfWeek],
AvailableBeginTime,
AvailableEndTime,
IsNoShow,
ActualHoursTotal,
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerScheduleWeekID,
@DayOfWeek,
@AvailableBeginTime,
@AvailableEndTime,
@IsNoShow,
@ActualHoursTotal,
SYSDATETIME(),
@ModifiedBy)

SET NOCOUNT OFF

GO
USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertVolunteerScheduleWeek')
BEGIN
DROP PROCEDURE dbo.InsertVolunteerScheduleWeek;
END;

GO
--This is a procedure to insert data into the VolunteerScheduleWeek Table
CREATE PROCEDURE dbo.InsertVolunteerScheduleWeek @VolunteerScheduleMonthID INT, @Week INT, @ModifiedBy NAME

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerScheduleWeek
(VolunteerScheduleMonthID,
[Week],
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerScheduleMonthID,
@Week,
SYSDATETIME(),
@ModifiedBy)

--I know setting nocount off is not necessary, but it looks good.
SET NOCOUNT OFF

GO
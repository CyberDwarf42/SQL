USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertVolunteerScheduleMonth')
BEGIN
DROP PROCEDURE dbo.InsertVolunteerScheduleMonth;
END;

GO
--Inserts data into the VolunteerScheduleMonth table.
CREATE PROCEDURE dbo.InsertVolunteerScheduleMonth @VolunteerPersonID INT, @Month INT, @ModifiedBy Name 

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerScheduleMonth
(VolunteerPersonID,
[Month],
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerPersonID,
@Month,
SYSDATETIME(),
@ModifiedBy)

SET NOCOUNT OFF

GO
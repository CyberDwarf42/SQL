USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DeleteVolunteerScheduleWeek')
BEGIN
DROP PROCEDURE dbo.DeleteVolunteerScheduleWeek
END;

GO
--Deletes data from the VolunteerScheduleWeek Table. 
CREATE PROCEDURE dbo.DeleteVolunteerScheduleWeek @VolunteerScheduleWeekID INT
AS
SET NOCOUNT ON

DELETE FROM Volunteer.VolunteerScheduleWeek
WHERE @VolunteerScheduleWeekID = VolunteerScheduleWeekID

SET NOCOUNT OFF
GO
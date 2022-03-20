USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DeleteVolunteerScheduleMonth')
BEGIN
DROP PROCEDURE dbo.DeleteVolunteerScheduleMonth
END;

GO
--Deletes data from the VolunteerScheduleMonth Table. 
CREATE PROCEDURE dbo.DeleteVolunteerScheduleMonth @VolunteerScheduleMonthID INT
AS
SET NOCOUNT ON
DELETE FROM Volunteer.VolunteerScheduleMonth
WHERE @VolunteerScheduleMonthID = VolunteerScheduleMonthID

SET NOCOUNT OFF
GO
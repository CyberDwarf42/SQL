USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DeleteVolunteerScheduleDayTime')
BEGIN
DROP PROCEDURE dbo.DeleteVolunteerScheduleDayTime
END;

GO
--Deletes data from the VolunteerScheduleDayTime Table. 
CREATE PROCEDURE dbo.DeleteVolunteerScheduleDayTime @VolunteerScheduleDayTimeID INT
AS
SET NOCOUNT ON

DELETE FROM Volunteer.VolunteerScheduleDayTime
WHERE @VolunteerScheduleDayTimeID = VolunteerScheduleDayTimeID

SET NOCOUNT OFF
GO
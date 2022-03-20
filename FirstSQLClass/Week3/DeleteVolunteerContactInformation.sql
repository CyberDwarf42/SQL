USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DeleteVolunteerContactInformation')
BEGIN
DROP PROCEDURE dbo.DeleteVolunteerContactInformation
END;

GO
 
CREATE PROCEDURE dbo.DeleteVolunteerContactInformation @VolunteerPersonID INT
AS

SET NOCOUNT ON
--Deletes data from VolunteerContactInformation Table on the ID matching the ID.
DELETE FROM Volunteer.VolunteerContactInformation
WHERE @VolunteerPersonID = VolunteerPersonID

SET NOCOUNT OFF

GO
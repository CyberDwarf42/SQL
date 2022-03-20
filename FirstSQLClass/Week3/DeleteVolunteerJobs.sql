USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DeleteVolunteerJobs')
BEGIN
DROP PROCEDURE dbo.DeleteVolunteerJobs
END;

GO
 
CREATE PROCEDURE dbo.DeleteVolunteerJobs @VolunteerJobsID INT
AS

SET NOCOUNT ON
--Deletes data from VolunteerJobs Table on the ID matching the ID.
DELETE FROM Volunteer.VolunteerJobs
WHERE @VolunteerJobsID = VolunteerJobsID

SET NOCOUNT OFF

GO
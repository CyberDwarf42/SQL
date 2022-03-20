USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertVolunteerJobs')
BEGIN
DROP PROCEDURE dbo.InsertVolunteerJobs
END;

GO
--Inserts data into the VolunteerJobs Table. 
CREATE PROCEDURE dbo.InsertVolunteerJobs @VolunteerPersonID INT, @Job NVARCHAR(50), @ModifiedBy Name 

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerJobs
(VolunteerPersonID,
Job,
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerPersonID,
@Job,
SYSDATETIME(),
@ModifiedBy)

SET NOCOUNT OFF

GO
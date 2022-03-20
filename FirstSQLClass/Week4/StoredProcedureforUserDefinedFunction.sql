USE ChamplainCharityLLC
GO

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'VolunteerGetWorkHistory')
BEGIN
DROP PROCEDURE dbo.VolunteerGetWorkHistory
END;

GO

--This stored procedure will generate the work history of a Volunteer Persons ID. 
--It will use a CTE to get a list of WeekIDs for a particular PersonID, so that we get a list of hours per day.
--Not a total amount of hours worked. 
CREATE PROCEDURE dbo.VolunteerGetWorkHistory (@VolunteerPersonID int)
AS
BEGIN

WITH VolunteerWorkHistory (ActualHoursTotal, [Day], [Week], [Month], FullName, IsActive)
AS
(SELECT g.*, CONCAT(c.ContactFirstName, ' ', c.ContactLastName) AS FullName, c.IsActive
FROM GetWorkHistory(@VolunteerPersonID) AS g
INNER JOIN Volunteer.VolunteerContactInformation AS c
ON @VolunteerPersonID = c.VolunteerPersonID
)
SELECT * FROM VolunteerWorkHistory

END
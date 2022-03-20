USE ChamplainCharityLLC
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'VolunteerWorkHistory')
BEGIN
DROP PROCEDURE dbo.VolunteerWorkHistory;
END;

GO

CREATE PROCEDURE dbo.VolunteerWorkHistory (@VolunteerPersonID int)
AS
BEGIN

WITH WorkHistory (MonthID, WeekID, DayID, [Hours], PersonID)
AS (SELECT m.[Month], w.[Week], d.[DayOfWeek], COUNT(d.ActualHoursTotal) AS [Hours], m.VolunteerPersonID
FROM Volunteer.VolunteerScheduleMonth AS m
INNER JOIN Volunteer.VolunteerScheduleWeek AS w
ON m.VolunteerScheduleMonthID = w.VolunteerScheduleMonthID
INNER JOIN Volunteer.VolunteerScheduleDayTime as d
ON w.VolunteerScheduleWeekID = d.VolunteerScheduleDayTimeID
WHERE m.VolunteerPersonID = @VolunteerPersonID
GROUP BY m.[Month], w.[Week], d.[DayOfWeek], d.ActualHoursTotal, m.VolunteerPersonID)


SELECT CONCAT(v.ContactFirstName, ' ', v.ContactLastName) as FullName
FROM Volunteer.VolunteerContactInformation as v
INNER JOIN WorkHistory as h
ON h.PersonID = v.ContactPersonID

GROUP BY h.MonthID, h.WeekID, h.DayID, h.[Hours], h.PersonID, v.ContactFirstName, v.ContactLastName

END;
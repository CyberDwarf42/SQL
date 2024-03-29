USE [ChamplainCharityLLC]
GO

CREATE FUNCTION [dbo].[GetWorkHistory]
	(@VolunteerPersonID int)
	RETURNS TABLE
	AS
	RETURN
		SELECT v.ActualHoursTotal, w.[Week], m.[MonthName], d.[DayOfWeek] FROM Volunteer.VolunteerScheduleDayTime as v
		INNER JOIN Volunteer.VolunteerScheduleWeek as w
		on v.VolunteerScheduleWeekID = w.VolunteerScheduleWeekID
		INNER JOIN Volunteer.VolunteerScheduleMonth as s
		on s.VolunteerScheduleMonthID = w.VolunteerScheduleMonthID
		INNER JOIN Volunteer.LUVolunteerDay as d
		ON v.[DayOfWeek] = d.[DayOfWeekID]
		INNER JOIN Volunteer.LUVolunteerScheduleMonth as m
		ON s.[Month] = m.[MonthID]
		WHERE @VolunteerPersonID = VolunteerPersonID;

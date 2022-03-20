USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'MaintenanceReport')
BEGIN
DROP PROCEDURE dbo.MaintenanceReport;
END;

GO
CREATE PROCEDURE dbo.MaintenanceReport(@BeginDate DATE, @EndDate DATE)
AS
BEGIN
--This selects a set of information from the Maintenance table as well as a row from the truck table--
SELECT M.MaintenanceStart, M.MaintenanceEnd, M.Truck, T.TruckType
FROM dbo.Maintenance AS M
--Joins the truck table when the TruckIDs match--
INNER JOIN Trucks as T
ON M.Truck = T.TruckNumber
--Uses the specified dates at the beginning of the procedure to filter what Maintenance events are shown--
WHERE M.MaintenanceStart >= @BeginDate
AND M.MaintenanceEnd <= @EndDate
GROUP BY M.MaintenanceStart, M.MaintenanceEnd, M.Truck, T.TruckType
--Orders it by the truck type first and then by when the maintenance started.--
ORDER BY T.TruckType, M.MaintenanceStart

END
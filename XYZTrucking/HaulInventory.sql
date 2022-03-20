USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'HaulInventory')
BEGIN
DROP PROCEDURE dbo.HaulInventory;
END;

GO

CREATE PROCEDURE dbo.HaulInventory (@TruckNumber INT, @Date1 DATE, @Date2 DATE)
AS
BEGIN
--The below section selects all of the rows in a table that match certain criteria--
SELECT H.*, I.*
FROM dbo.HaulRecord as H
INNER JOIN dbo.HaulManifest as I
ON H.HaulNumber = I.HaulNumber
WHERE H.TruckUsed = @TruckNumber
AND H.DateHBegan >= @Date1
AND H.DateHDelivered <= @Date2
--Then the information is ordered by the Date the Haul Began from the 
ORDER BY H.DateHBegan DESC

END
USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'HaulReport')
BEGIN
DROP PROCEDURE dbo.HaulReport;
END;

GO
CREATE PROCEDURE dbo.HaulReport (@TruckNumber INT, @Date1 DATE, @Date2 DATE)
AS
BEGIN
--This selects all of the records of a truck in between certain dates and orders them starting with the oldest haul.--
SELECT * 
FROM dbo.HaulRecord
WHERE TruckUsed = @TruckNumber
AND DateHBegan >= @Date1
AND DateHDelivered <= @Date2
ORDER BY DateHBegan ASC

END
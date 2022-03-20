USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DriverHaulReport')
BEGIN
DROP PROCEDURE dbo.DriverHaulReport;
END;

GO
-- Initially I wanted you to be able to look up a driver name and then be able to look up their hauls--
-- However I was unable to get that to work, so I decided to do this instead, it has the same idea--
-- except it used the Employee ID. 
CREATE PROCEDURE dbo.DriverHaulReport (@EmployeeID INT)
AS
BEGIN
SELECT H.HaulNumber, H.Client, H.DateHBegan, H.DateHDelivered, H.Mileage, H.HaulNotes,
CONCAT(D.FirstName, ' ', D.LastName) AS Name, L.CargoType, TU.TruckDesc
-- The following section joins a number of tables together to give a nice readable end result--
FROM HaulRecord AS H
INNER JOIN dbo.Drivers as D
ON H.EmployeeID = D.EmployeeID
INNER JOIN dbo.LUCargoTypeID as L
ON H.CargoTypeID = L.CargoTypeID
INNER JOIN dbo.Trucks as TU
ON H.TruckUsed = TU.TruckNumber
--This is what picks which hauls are used--
WHERE H.EmployeeID = @EmployeeID
GROUP BY D.FirstName, D.LastName, H.HaulNumber, H.Client, TU.TruckDesc,
L.CargoType, H.DateHBegan, H.DateHDelivered, H.Mileage, H.HaulNotes
--Orders this by oldest Haul first--
ORDER BY H.DateHBegan ASC

END

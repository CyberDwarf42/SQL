USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'HaulRecordUpdate')
BEGIN
DROP PROCEDURE dbo.HaulRecordUpdate;
END

GO

CREATE PROCEDURE dbo.HaulRecordUpdate @HaulNumber INT, @TrailerID INT, @EmployeeID INT, @TruckUsed INT, @Client VARCHAR(40),
@CargoTypeID INT, @DateHBegan DATE, @DateHDelivered DATE, @Mileage INT, @HaulNotes VARCHAR(300)

AS

SET NOCOUNT ON
--Updates table with values that are specified, if none are specified return original value--
UPDATE HaulRecord
SET TrailerID = ISNULL(@TrailerID, TrailerID),
	EmployeeID = ISNULL(@EmployeeID, EmployeeID),
	TruckUsed = ISNULL(@TruckUsed, TruckUsed),
	Client = ISNULL(@Client, Client),
	CargoTypeID = ISNULL(@CargoTypeID, Client),
	DateHBegan = ISNULL(@DateHBegan, DateHBegan),
	DateHDelivered = ISNULL(@DateHDelivered, DateHDelivered),
	Mileage = ISNULL(@Mileage, Mileage)
WHERE HaulNumber = @HaulNumber

SET NOCOUNT OFF
GO
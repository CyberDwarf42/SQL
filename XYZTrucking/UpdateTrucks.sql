USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'UpdateTrucks')
BEGIN
DROP PROCEDURE dbo.UpdateTrucks;
END

GO

CREATE PROCEDURE dbo.UpdateTrucks @TruckNumber INT, @TruckDesc VARCHAR(400), @TruckType VARCHAR(40), @BodyType VARCHAR(40),
@LicenseNumber VARCHAR(10), @EngineType VARCHAR(30), @FuelType VARCHAR(15), @CurrentMileage INT

AS

SET NOCOUNT ON

UPDATE Trucks
SET TruckDesc = ISNULL(@TruckDesc, TruckDesc),
	TruckType = ISNULL(@TruckType, TruckType),
	BodyType = ISNULL(@BodyType, BodyType),
	LicenseNumber = ISNULL(@LicenseNumber, LicenseNumber),
	EngineType = ISNULL(@EngineType, EngineType),
	FuelType = ISNULL(@FuelType, FuelType),
	CurrentMileage = ISNULL(@CurrentMileage, CurrentMileage)
WHERE TruckNumber = @TruckNumber

SET NOCOUNT OFF
GO
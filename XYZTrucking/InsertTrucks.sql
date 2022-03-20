USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertTrucks')
BEGIN
DROP PROCEDURE dbo.InsertTrucks;
END;

GO

CREATE PROCEDURE dbo.InsertTrucks @TruckDesc varchar(400), @TruckType varchar(40), @BodyType varchar(40), 
@LicenseNumber varchar(10), @EngineType varchar(30), @FuelType varchar(15), @CurrentMileage int

AS

SET NOCOUNT ON
--standard insert procedure--
INSERT INTO dbo.Trucks
(TruckDesc,
TruckType,
BodyType,
LicenseNumber,
EngineType,
FuelType,
CurrentMileage)

VALUES
(@TruckDesc,
@TruckType,
@BodyType,
@LicenseNumber,
@EngineType,
@FuelType,
@CurrentMileage)

SET NOCOUNT OFF

GO

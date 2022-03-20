USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertHaulRecord')
BEGIN
DROP PROCEDURE dbo.InsertHaulRecord;
END;

GO

CREATE PROCEDURE dbo.InsertHaulRecord @TrailerID int, @EmployeeID int, @TruckUsed int, @Client varchar(40),
@CargoTypeID int, @DateHBegan date, @DateHDelivered date, @Mileage int, @HaulNotes varchar(400)

AS 

SET NOCOUNT ON
--straightforward insert procedure--
INSERT INTO dbo.HaulRecord
(TrailerID,
EmployeeID,
TruckUsed,
Client,
CargoTypeID,
DateHBegan,
DateHDelivered,
Mileage,
HaulNotes)

VALUES
(@TrailerID, 
@EmployeeID, 
@TruckUsed, 
@Client, 
@CargoTypeID, 
@DateHBegan, 
@DateHDelivered, 
@Mileage, 
@HaulNotes)

SET NOCOUNT OFF

GO



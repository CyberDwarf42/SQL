USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'TruckDelete')
BEGIN
DROP PROCEDURE dbo.TruckDelete;
END;

GO

CREATE PROCEDURE dbo.TruckDelete @TruckNumber int

AS

SET NOCOUNT ON

--deletes the truck specified from the database--

DELETE FROM dbo.Trucks WHERE TruckNumber = @TruckNumber;

SET NOCOUNT OFF

GO
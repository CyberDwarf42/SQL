USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertTrailers')
BEGIN
DROP PROCEDURE dbo.InsertTrailers;
END;

GO

CREATE PROCEDURE dbo.InsertTrailers @TrailerTypeID int, @TrailerCapacity varchar(20), @TrailerMileage int, @TrailerDescription varchar(200)

AS

SET NOCOUNT ON
--standard insert procedure--
INSERT INTO dbo.TrailerInfo
(TrailerTypeID,
TrailerCapacity,
TrailerMileage,
TrailerDescription)

VALUES
(@TrailerTypeID,
@TrailerCapacity,
@TrailerMileage,
@TrailerDescription)

SET NOCOUNT OFF

GO
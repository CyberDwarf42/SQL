USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'TrailerInfoUpdate')
BEGIN
DROP PROCEDURE dbo.TrailerInfoUpdate;
END

GO

CREATE PROCEDURE dbo.TrailerInfoUpdate @TrailerID INT, @TrailerTypeID INT, @TrailerCapacity VARCHAR(20), @TrailerMileage INT,
@TrailerDescription VARCHAR(200)

AS

SET NOCOUNT ON
--Updates the columns with new rows unless input is null, if input is null then repeat original value.--
UPDATE TrailerInfo
SET TrailerTypeID = ISNULL(@TrailerTypeID, TrailerTypeID),
	TrailerCapacity = ISNULL(@TrailerCapacity, TrailerCapacity),
	TrailerMileage = ISNULL(@TrailerMileage, TrailerMileage),
	TrailerDescription = ISNULL(@TrailerDescription, TrailerDescription)
WHERE TrailerID = @TrailerID

SET NOCOUNT OFF
GO
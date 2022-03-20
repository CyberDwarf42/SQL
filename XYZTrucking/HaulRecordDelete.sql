USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'HaulDelete')
BEGIN
DROP PROCEDURE dbo.HaulDelete;
END;

GO

CREATE PROCEDURE dbo.HaulDelete @HaulNumber int

AS

SET NOCOUNT ON

--Deletes the Entire Haul from the database--

DELETE FROM HaulRecord WHERE HaulNumber = @HaulNumber;

SET NOCOUNT OFF

GO
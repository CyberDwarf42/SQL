USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DriversDelete')
BEGIN
DROP PROCEDURE dbo.DriversDelete;
END;

GO

CREATE PROCEDURE dbo.DriversDelete @EmployeeID int

AS

SET NOCOUNT ON
-- This selects the drivers ID and deletes it from the system--
DELETE FROM dbo.Drivers WHERE EmployeeID = @EmployeeID;

SET NOCOUNT OFF

GO
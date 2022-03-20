USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'MaintenanceDelete')
BEGIN
DROP PROCEDURE dbo.MaintenanceDelete;
END;

GO

CREATE PROCEDURE dbo.MaintenanceDelete @MaintenanceLogNumber int

AS

SET NOCOUNT ON
--deletes specified maintenance log number from the database--
DELETE FROM dbo.Maintenance WHERE MaintenanceLogNumber = @MaintenanceLogNumber;

SET NOCOUNT OFF

GO
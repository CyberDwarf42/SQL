USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertMaintenance')
BEGIN
DROP PROCEDURE dbo.InsertMaintenance;
END;

GO

CREATE PROCEDURE dbo.InsertMaintenance @Truck int, @MaintenanceStart date, @MaintenanceEnd date, @MaintenanceTypeID int, @MaintenanceCodeID int

AS

SET NOCOUNT ON

--Standard Insert procedure--

INSERT INTO dbo.Maintenance
(Truck,
MaintenanceStart,
MaintenanceEnd,
MaintenanceTypeID,
MaintenanceCodeID)

VALUES
(@Truck,
@MaintenanceStart,
@MaintenanceEnd,
@MaintenanceTypeID,
@MaintenanceCodeID)

SET NOCOUNT OFF

GO

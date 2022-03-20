USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'MaintenanceUpdate')
BEGIN
DROP PROCEDURE dbo.MaintenanceUpdate;
END

GO

CREATE PROCEDURE dbo.MaintenanceUpdate @MaintenanceLogNumber INT, @Truck INT, @MaintenanceStart DATE, @MaintenanceEnd DATE,
@MaintenanceTypeID INT, @MaintenanceCodeID INT

AS

SET NOCOUNT ON
--If the input is null, it repeats the original value, otherwise udpates the values.--
UPDATE Maintenance
SET Truck = ISNULL(@Truck, Truck),
	MaintenanceStart = ISNULL(@MaintenanceStart, MaintenanceStart),
	MaintenanceEnd = ISNULL(@MaintenanceEnd, MaintenanceEnd),
	MaintenanceTypeID = ISNULL(@MaintenanceTypeID, MaintenanceTypeID),
	MaintenanceCodeID = ISNULL(@MaintenanceCodeID, MaintenanceCodeID)
WHERE MaintenanceLogNumber = @MaintenanceLogNumber

SET NOCOUNT OFF
GO
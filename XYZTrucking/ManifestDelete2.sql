USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'ManifestDelete2')
BEGIN
DROP PROCEDURE dbo.ManifestDelete2;
END;

-- This will delete all records of a haul in the Haul Manifest table

GO

CREATE PROCEDURE dbo.ManifestDelete2 @HaulNumber int

AS

SET NOCOUNT ON

DELETE FROM dbo.HaulManifest WHERE HaulNumber = @HaulNumber;

SET NOCOUNT OFF

GO


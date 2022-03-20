USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'ManifestDelete3')
BEGIN
DROP PROCEDURE dbo.ManifestDelete3;
END;

--This will only delete a specific item from a specific haul

GO

CREATE PROCEDURE dbo.ManifestDelete3 @Item varchar(30), @HaulNumber int

AS

SET NOCOUNT ON

DELETE FROM dbo.HaulManifest WHERE Item = @Item AND HaulNumber = @HaulNumber;

SET NOCOUNT OFF

GO
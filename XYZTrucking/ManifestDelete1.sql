USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'ManifestDelete1')
BEGIN
DROP PROCEDURE dbo.ManifestDelete1;
END;

--This particular Procedure will delete all records of a Part Number

GO

CREATE PROCEDURE dbo.ManifestDelete1 @Item varchar(30)

AS

SET NOCOUNT ON

DELETE FROM dbo.HaulManifest WHERE Item = @Item;

SET NOCOUNT OFF

GO
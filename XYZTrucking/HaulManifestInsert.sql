USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertManifest')
BEGIN
DROP PROCEDURE dbo.InsertManifest;
END;

GO

CREATE PROCEDURE dbo.InsertManifest @Item varchar(30), @Itemdesc varchar(30), 
@ItemWeightPU varchar(15), @Quantity int, @HaulNumber int

AS

SET NOCOUNT ON
--Straightforward inserting of information--
INSERT INTO dbo.HaulManifest
(Item,
Itemdesc,
ItemWeightPU,
Quantity,
HaulNumber)

VALUES
(@Item,
@Itemdesc,
@ItemWeightPU,
@Quantity,
@HaulNumber)

SET NOCOUNT OFF

GO
USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'UpdateItem')
BEGIN
DROP PROCEDURE dbo.UpdateItem;
END

GO

CREATE PROCEDURE dbo.UpdateItem @Item VARCHAR(30), @ItemDesc VARCHAR(30), @ItemWeightPU VARCHAR(15)

AS

SET NOCOUNT ON
--This updates the information on an item--
UPDATE HaulManifest
SET Itemdesc  = ISNULL(@ItemDesc, Itemdesc),
	ItemWeightPU = ISNULL(@ItemWeightPU, ItemWeightPU)
WHERE Item = @Item

SET NOCOUNT OFF
GO
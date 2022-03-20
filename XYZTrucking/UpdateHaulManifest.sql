USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'UpdateHaulManifest')
BEGIN
DROP PROCEDURE dbo.UpdateHaulManifest;
END

GO

CREATE PROCEDURE dbo.UpdateHaulManifest @Item VARCHAR(30), @ItemDesc VARCHAR(30), @ItemWeightPU VARCHAR(30),
@Quantity INT, @HaulNumber INT

AS

SET NOCOUNT ON
--This updates the Items associated with a Haul--
UPDATE HaulManifest
SET Item = ISNULL(@Item, Item),
	Itemdesc = ISNULL(@ItemDesc, Itemdesc),
	ItemWeightPU = ISNULL(@ItemWeightPU, ItemWeightPU),
	Quantity = ISNULL(@Quantity, Quantity)
WHERE HaulNumber = @HaulNumber

SET NOCOUNT OFF
GO
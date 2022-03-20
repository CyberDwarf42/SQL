USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'TrailerDelete')
BEGIN
DROP PROCEDURE dbo.TrailerDelete;
END;

GO

CREATE PROCEDURE dbo.TrailerDelete @TrailerID int

AS

SET NOCOUNT ON

--deletes specified trailer from database--

DELETE FROM dbo.TrailerInfo WHERE TrailerID = @TrailerID;

SET NOCOUNT OFF

GO

USE XYZTrucking
IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertDrivers')
BEGIN
DROP PROCEDURE dbo.InsertDrivers;
END;

GO

CREATE PROCEDURE dbo.InsertDrivers @FirstName varchar(40), @LastName varchar(40), @DateofHire date, @CDL bit

AS

SET NOCOUNT ON
--standard insert procedure--
INSERT INTO dbo.Drivers
(FirstName,
LastName,
DateofHire,
CDL)

VALUES
(@FirstName,
@LastName,
@DateofHire,
@CDL)

SET NOCOUNT OFF

GO
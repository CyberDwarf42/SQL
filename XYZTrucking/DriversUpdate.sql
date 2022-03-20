USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'DriversUpdate')
BEGIN
DROP PROCEDURE dbo.DriversUpdate;
END

GO

CREATE PROCEDURE dbo.DriversUpdate  @EmployeeID INT, @FirstName VARCHAR(40), @LastName VARCHAR(40), @DateofHire DATE,
@CDL bit

AS

SET NOCOUNT ON
--Updates the Drivers table with the new values when the IDs match--
UPDATE Drivers
SET FirstName = ISNULL(@FirstName, FirstName),
	LastName = ISNULL(@LastName, LastName),
	DateofHire = ISNULL(@DateofHire, DateofHire),
	CDL = ISNULL(@CDL, CDL)
WHERE EmployeeID = @EmployeeID

SET NOCOUNT OFF
GO

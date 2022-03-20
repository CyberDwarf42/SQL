USE XYZTrucking;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [name] = 'LUCargoTypeID')
BEGIN
DROP TABLE dbo.LUCargoTypeID;
END;

CREATE TABLE dbo.LUCargoTypeID
(
CargoTypeID INT IDENTITY(1,1),
CargoType VARCHAR(30),

CONSTRAINT PK_LUCargoTypeID PRIMARY KEY (CargoTypeID)
);

GO
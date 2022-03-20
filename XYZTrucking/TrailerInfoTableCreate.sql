USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.tables WHERE [name] = 'TrailerInfo')
BEGIN
DROP TABLE dbo.TrailerInfo;
END;

CREATE TABLE dbo.TrailerInfo
(
TrailerID INT IDENTITY(1,1) NOT NULL,
TrailerTypeID INT NOT NULL,
TrailerCapacity INT NOT NULL,
TrailerMileage INT NOT NULL,
TrailerDescription VARCHAR(200),
CONSTRAINT PK_TrailerInfo PRIMARY KEY (TrailerID)
);

GO
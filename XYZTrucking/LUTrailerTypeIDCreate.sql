USE XYZTrucking;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [name] = 'LUTrailerTypeID')
BEGIN
DROP TABLE dbo.LUTrailerTypeID;
END;

CREATE TABLE dbo.LUTrailerTypeID
(TrailerTypeID INT IDENTITY(1,1),
TrailerType VARCHAR(20),

CONSTRAINT PK_LUTrailerTypeID PRIMARY KEY (TrailerTypeID)
);

GO

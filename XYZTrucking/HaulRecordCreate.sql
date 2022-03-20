USE XYZTrucking

IF EXISTS (SELECT 1 FROM sys.tables WHERE [name] = 'HaulRecord')
BEGIN
DROP TABLE dbo.HaulRecord;
END;

CREATE TABLE dbo.HaulRecord
(
HaulNumber INT IDENTITY (1,1),
TruckUsed INT NOT NULL,
Client VARCHAR(40) NOT NULL,
CargoTypeID INT NOT NULL,
DateHBegan DATE NOT NULL,
DateHDelivered DATE NOT NULL,
Mileage INT NOT NULL,
HaulNotes VARCHAR(400),

CONSTRAINT PK_HaulRecord PRIMARY KEY (HaulNumber)
);

GO 

USE XYZTrucking;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [name] = 'HaulManifest')
BEGIN
DROP TABLE dbo.HaulManifest;
END;

CREATE TABLE dbo.HaulManifest
(
Item VARCHAR(30) NOT NULL,
Itemdesc VARCHAR(30) NOT NULL,
ItemWeightPU VARCHAR(15) NOT NULL,
Quantity INT NOT NULL,
HaulNumber INT NOt NUll

CONSTRAINT PK_HaulManifest PRIMARY KEY (Item)
);

GO
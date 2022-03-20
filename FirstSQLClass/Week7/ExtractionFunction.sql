USE ChamplainCharityLLC
GO

ALTER FUNCTION [dbo].[GetInfoList]
	(@PersonID int, @ContactEmail NVARCHAR(30), @VolunteerType int, @ContactPersonID int,
	@IsActive bit, @ModifiedBy Name)
	RETURNS TABLE
	AS
	RETURN
		SELECT p.FirstName, p.LastName, CONCAT(a.AddressLine1, ' ', a.City, ', ', a.[State], ' ', a.PostalCode) AS [AddressLine1],
		ph.PhoneNumber, ContactEmail = @ContactEmail, VolunteerType = @VolunteerType,
		ContactPersonID = @ContactPersonID, IsActive = @IsActive, ModifiedBy = @ModifiedBy
		FROM Person.Person AS p
		INNER JOIN Person.[Address] AS a
		ON p.PersonID = a.PersonID
		INNER JOIN Person.Phone AS ph
		ON p.PersonID = ph.PersonID AND ph.PhoneType = 3
		WHERE @PersonID = p.PersonID AND a.AddressTypeID = 1
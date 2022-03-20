USE ChamplainCharityLLC
GO
--This is my CTE expression
WITH FamilySize(FamilySize, ClientPersonID) 
		AS (Select Count(PersonID) as PersonAmount, ClientPersonID 
		FROM Person.FamilyRelationships GROUP BY ClientPersonID)
--This uses the CTE to call up the name of the heads of household along with the size of their family
	SELECT LTRIM(RTRIM(CONCAT(COALESCE(Title, ' '), ' ', FirstName, ' ', LastName))) AS FullName, F.FamilySize
	FROM Person.Person AS P
--This join brings in the information from the CTE
	RIGHT JOIN FamilySize as F
	ON PersonID = ClientPersonID;
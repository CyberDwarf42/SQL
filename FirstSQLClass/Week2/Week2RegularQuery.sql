USE ChamplainCharityLLC
GO
--This is my regular syntax of the same query.
SELECT LTRIM(RTRIM(CONCAT(COALESCE(p.Title, ' '), ' ',p.FirstName, ' ', p.LastName))) as FullName, 
--I tried reusing the values included in the CTE query, but I could not get the same result,
--thus I just used the ClientPersonID as it got me the same result as the other query. 
	COUNT(f.ClientPersonID) AS FamilySize 
FROM Person.FamilyRelationships f
Join Person.Person p
on p.PersonID = f.ClientPersonID
GROUP BY p.Title, p.FirstName, p.LastName, f.ClientPersonID
--This was in some ways a simpler query, but at the same time more difficult.  
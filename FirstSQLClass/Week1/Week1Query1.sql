USE ChamplainCharityLLC

SELECT P.FirstName, P.LastName, D.FamilyStatusType, D.HousingStatus
FROM Person.Person as P
JOIN Person.Demographics as D
ON P.PersonID = D.PersonID

GROUP BY P.FirstName, P.LastName, D.FamilyStatusType, D.HousingStatus;
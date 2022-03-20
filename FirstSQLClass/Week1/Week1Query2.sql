USE ChamplainCharityLLC

SELECT P.FirstName, P.LastName, F.RelationshipID, F.RelationDescription
FROM Person.Person as P
JOIN Person.FamilyRelationships as F
ON P.PersonID = F.PersonID

WHERE P.LastName = 'Johnston'

GROUP BY P.FirstName, P.LastName, F.RelationshipID, F.RelationDescription 

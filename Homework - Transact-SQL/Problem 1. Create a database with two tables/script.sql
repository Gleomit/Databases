CREATE PROCEDURE GetPersonsFullName
AS 
	SELECT (FirstName + ' ' + LastName) FROM Persons
GO
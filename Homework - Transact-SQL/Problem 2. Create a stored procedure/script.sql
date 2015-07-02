CREATE PROCEDURE GetPersonsByMinBalance
	@number money
AS 
	SELECT * FROM Persons AS p
	INNER JOIN Accounts AS a ON a.PersonID = p.Id
	WHERE a.Balance > @number
GO
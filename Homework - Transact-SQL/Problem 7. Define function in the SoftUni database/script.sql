use SoftUni;
GO

/* SoftUni function */
CREATE FUNCTION ufn_EmployeeAndTownNamesInGivenString(@string NVARCHAR(100))
RETURNS TABLE
AS
BEGIN
	SELECT (e.FirstName + ' ' + e.MiddleName + ' ' + e.LastName) AS [Name]
		FROM Employees AS e 
		WHERE ufn_CheckWord(@string, e.FirstName) = 1 
			OR ufn_CheckWord(@string, e.MiddleName) = 1
			OR ufn_CheckWord(@string, e.LastName) = 1
	UNION
	SELECT t.Name AS [Name] FROM Towns AS t
		WHERE ufn_CheckWord(@string, t.Name) = 1
END

GO

/* The function for checking word */

CREATE FUNCTION ufn_CheckWord(@string NVARCHAR(100), @word NVARCHAR(100))
RETURNS INT
BEGIN
	DECLARE  @char NVARCHAR(1)

	DECLARE @index INT, @len INT
	SET @index = 1
	SET @len= LEN(@word)
	
	WHILE @index <= @len
	BEGIN
		SET @char = SUBSTRING(@word, @index, 1)

		if CHARINDEX(@char, @string) = 0
			BEGIN
				RETURN 0
			END

		SET @index= @index+ 1
	END

	RETURN 1
END


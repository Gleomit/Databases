CREATE PROCEDURE usp_SelectInterestOfAccount(@accountId  int, @interestRate money)
AS
	DECLARE @oldSum money
	SELECT 	@oldSum = Balance FROM Accounts
	WHERE Id = @accountId

	DECLARE @newSum MONEY
	SET @newSum = ufn_CalculateFutureSum(@oldSum, @interestRate, 1)

	SELECT @newSum - @oldSum AS [Interest for month]
GO
CREATE PROCEDURE usp_WithdrawMoney (@AccountId  int, @money money)
AS
	DECLARE @oldSum money
	SELECT 	@oldSum = Balance FROM Accounts
	WHERE Id = @AccountId

	IF (@money < 0) 
		BEGIN
			RAISERROR ('The amount must be positive.', 16, 1)
		END

	IF (@money > @oldSum) 
		BEGIN
			RAISERROR ('The amount should be less than the balance.', 16, 1)
		END

	UPDATE Accounts AS a
	SET a.Balance = (a.Balance - @money)
	WHERE a.Id = @AccountId
GO

CREATE PROCEDURE usp_DepositMoney (@AccountId  int, @money money)
AS
	DECLARE @oldSum money
	SELECT 	@oldSum = Balance FROM Accounts
	WHERE Id = @AccountId

	IF (@money < 0)
		BEGIN
			RAISERROR ('The amount must be positive.', 16, 1)
		END

	UPDATE Accounts AS a
	SET a.Balance = (a.Balance + @money)
	WHERE a.Id = @AccountId
GO
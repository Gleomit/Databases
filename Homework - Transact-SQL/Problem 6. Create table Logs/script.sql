CREATE TABLE Logs(
	LogID int PRIMARY KEY IDENTITY NOT NULL,
	AccountID int NOT NULL,
	OldValue money NULL,
	NewValue money NULL)
GO

CREATE TRIGGER tr_BankAccountsChange ON Accounts
FOR UPDATE
AS
INSERT INTO Logs (AccountID, NewValue, OldValue)
	SELECT d.Id, i.Balance,	d.Balance
	FROM inserted i	JOIN deleted d ON d.Id = i.Id
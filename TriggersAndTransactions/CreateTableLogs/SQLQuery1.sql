--USE Bank

--CREATE TABLE Logs
--(
--	LogId INT PRIMARY KEY IDENTITY,
--	AccountId INT NOT NULL REFERENCES Accounts(Id),
--	OldSum MONEY NOT NULL,
--	NewSum MONEY NOT NULL
--)

CREATE TRIGGER tr_AddToLogsOnAccountUpdate
ON Accounts FOR UPDATE
AS
	INSERT INTO Logs(AccountId, OldSum, NewSum)
	(SELECT i.Id, d.Balance, i.Balance
		FROM inserted i
		JOIN deleted d ON d.Id = i.Id
		WHERE i.Balance <> d.Balance)


--UPDATE Accounts
--SET Balance -= 10
--WHERE Id = 1
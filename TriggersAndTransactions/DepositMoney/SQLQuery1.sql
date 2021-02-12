CREATE PROC usp_DepositMoney(@AccountId INT, @MoneyAmount DECIMAL(15, 4))
AS
	BEGIN TRANSACTION

	DECLARE @account INT = (SELECT Id FROM Accounts WHERE Id = @AccountId)

	IF(@account IS NULL)
	BEGIN
		ROLLBACK;
		THROW 50001, 'Invalid account id!', 1
		RETURN
	END
	IF(@MoneyAmount < 0)
	BEGIN
		ROLLBACK;
		THROW 50002, 'Deposit amount cannot be negative!', 1
		RETURN
	END

	UPDATE Accounts
	SET Balance += @MoneyAmount
	WHERE Id = @AccountId
	COMMIT

--EXEC usp_DepositMoney 1, 10
--SELECT *
--	FROM Accounts
--	WHERE Id = 1
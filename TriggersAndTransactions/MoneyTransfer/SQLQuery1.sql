CREATE PROC	usp_TransferMoney (@SenderId INT, @ReceiverId INT, @Amount DECIMAL(15,4))
AS
	BEGIN TRANSACTION
		EXEC usp_WithdrawMoney @SenderId, @Amount
		EXEC usp_DepositMoney @ReceiverId, @Amount
	COMMIT 

EXEC usp_TransferMoney 5, 1, 5000

SELECT *
	FROM Accounts
	WHERE Id = 1 OR Id = 5
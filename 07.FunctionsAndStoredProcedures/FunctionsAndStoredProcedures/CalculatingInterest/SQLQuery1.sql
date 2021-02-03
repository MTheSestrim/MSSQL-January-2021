--ALTER FUNCTION ufn_CalculateFutureValue
--(@InitialSum MONEY, @YearlyInterestRate FLOAT, @NumberOfYears INT)
--RETURNS MONEY
--AS
--	BEGIN
--		DECLARE @FutureValue MONEY;
--		SET @FutureValue = @InitialSum * (POWER((1 + @YearlyInterestRate), @NumberOfYears));
--		RETURN ROUND(@FutureValue, 4);
--	END
--GO

CREATE PROC usp_CalculateFutureValueForAccount
(@AccountId INT, @InterestRate FLOAT)
AS
	SELECT a.ID, ah.FirstName, ah.LastName, a.Balance, dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, 5)
		FROM Accounts a
		JOIN AccountHolders ah ON a.AccountHolderId = ah.Id
		WHERE @AccountId = a.Id
--GO

EXEC usp_CalculateFutureValueForAccount 1, 0.1
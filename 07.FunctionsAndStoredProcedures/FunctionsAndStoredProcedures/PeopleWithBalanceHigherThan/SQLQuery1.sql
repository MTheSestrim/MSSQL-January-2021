CREATE PROC usp_GetHoldersWithBalanceHigherThan(@BalanceMin MONEY)
AS
	SELECT FirstName, LastName
		FROM AccountHolders ah
		JOIN Accounts a ON a.AccountHolderId = ah.Id
		GROUP BY FirstName, LastName
		HAVING SUM(a.Balance) > @BalanceMin
		ORDER BY FirstName, LastName
GO

EXEC usp_GetHoldersWithBalanceHigherThan 100000.00
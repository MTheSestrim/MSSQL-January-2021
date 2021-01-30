SELECT SUM(rwpw.Diff)
	FROM(SELECT DepositAmount - LEAD(DepositAmount, 1, DepositAmount) OVER (ORDER BY Id) AS Diff 
		FROM WizzardDeposits) AS rwpw;
SELECT TOP(2) DepositGroup 
	FROM (SELECT DepositGroup, AVG(MagicWandSize) as AverageWandSize
	FROM WizzardDeposits
	GROUP BY DepositGroup) AS dg
	ORDER BY AverageWandSize ASC;
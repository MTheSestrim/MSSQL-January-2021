SELECT fl.FirstLetter 
	FROM (SELECT LEFT(FirstName, 1) AS FirstLetter
		FROM WizzardDeposits
		WHERE DepositGroup = 'Troll Chest') AS fl
	GROUP BY FirstLetter
	ORDER BY FirstLetter;
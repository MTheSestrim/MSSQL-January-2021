SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Mechanic,
	AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)) AS [Average Days]
	FROM Mechanics m
	JOIN Jobs j ON j.MechanicId = m.MechanicId
	GROUP BY m.MechanicId, CONCAT(m.FirstName, ' ', m.LastName)
	ORDER BY m.MechanicId
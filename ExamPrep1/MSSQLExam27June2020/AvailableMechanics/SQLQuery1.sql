SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Available
	FROM Mechanics m
	LEFT JOIN Jobs j ON j.MechanicId = m.MechanicId
	WHERE j.JobId IS NULL OR j.[Status] = 'Finished'
	GROUP BY m.MechanicId, CONCAT(m.FirstName, ' ', m.LastName)
	ORDER BY m.MechanicId ASC
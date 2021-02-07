-- Assume the current date is 24 April 2017
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS Client,
	DATEDIFF(DAY, j.IssueDate, '04/24/2017') AS [Days going],
	j.[Status]
	FROM Clients c
	JOIN Jobs j ON j.ClientId = c.ClientId
	WHERE j.Status <> 'Finished'
	ORDER BY [Days going] DESC, c.ClientId
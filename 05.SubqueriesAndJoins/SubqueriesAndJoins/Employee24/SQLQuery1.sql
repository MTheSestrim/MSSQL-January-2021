SELECT e.EmployeeID, e.FirstName, p.[Name]
	FROM Employees e
	JOIN EmployeesProjects ep ON ep.EmployeeID = e.EmployeeID
	LEFT JOIN Projects p ON p.ProjectID = ep.ProjectID AND DATEPART(YEAR, p.StartDate) < 2005
	WHERE e.EmployeeID = 24 
	ORDER BY e.EmployeeID ASC;
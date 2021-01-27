SELECT TOP (50) e.EmployeeID, e.FirstName, e.LastName, d.[Name]
	FROM Employees e
	JOIN Departments d ON d.DepartmentID = e.DepartmentID
	WHERE d.Name = 'Sales'
	ORDER BY e.EmployeeID ASC;
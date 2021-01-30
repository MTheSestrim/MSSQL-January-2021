SELECT DISTINCT RankedTable.DepartmentID, RankedTable.Salary AS ThirdHighestSalary
	FROM(SELECT DepartmentID, Salary, DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank]
			FROM Employees) AS RankedTable
	WHERE RankedTable.[Rank] = 3;
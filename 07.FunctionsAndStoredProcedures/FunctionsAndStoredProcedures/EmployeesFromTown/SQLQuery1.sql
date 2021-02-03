CREATE PROC usp_GetEmployeesFromTown (@TownName nvarchar(50))
AS
	SELECT FirstName, LastName
		FROM Employees e
		JOIN Addresses a ON a.AddressID = e.AddressID
		JOIN Towns t ON t.TownID = a.TownID
		WHERE t.[Name] = @TownName

EXEC usp_GetEmployeesFromTown 'Sofia'
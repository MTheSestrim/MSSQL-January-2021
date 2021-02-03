CREATE PROC usp_GetEmployeesSalaryAboveNumber
	(@Min DECIMAL(18,4))
AS
	SELECT FirstName, LastName
		FROM Employees
		WHERE Salary >= @Min
		
--EXEC usp_GetEmployeesSalaryAboveNumber 48100
--CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
--RETURNS VARCHAR(7)
--AS
--BEGIN
--	IF @salary < 30000 
--		RETURN 'Low'
--	ELSE IF @salary <= 50000 
--		RETURN 'Average'
--	
--	RETURN 'High'
--END

CREATE PROC usp_EmployeesBySalaryLevel(@levelOfSalary varchar(7))
AS
	SELECT FirstName, LastName
		FROM Employees e
		WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @levelOfSalary
--GO

--EXEC usp_EmployeesBySalaryLevel 'High'
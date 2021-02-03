CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(7)
AS
BEGIN
	IF @salary < 30000 
		RETURN 'Low'
	ELSE IF @salary <= 50000 
		RETURN 'Average'
	
	RETURN 'High'
END
--GO

--SELECT dbo.ufn_GetSalaryLevel(125500.00) FROM Employees WHERE EmployeeID = 1;
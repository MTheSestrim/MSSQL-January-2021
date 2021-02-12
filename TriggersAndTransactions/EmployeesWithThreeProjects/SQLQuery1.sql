--USE Softuni
CREATE PROCEDURE usp_AssignProject(@emloyeeId INT, @projectID INT)
AS
	BEGIN TRANSACTION
	DECLARE @CurrentProjectsCount INT = (SELECT COUNT(*) 
								FROM Employees e
								JOIN EmployeesProjects ep ON ep.EmployeeID = e.EmployeeID
								WHERE e.EmployeeID = @emloyeeId)

	IF(@CurrentProjectsCount >= 3)
	BEGIN
		ROLLBACK;
		THROW 50001, 'The employee has too many projects!', 1;
		RETURN;
	END

	IF NOT EXISTS (SELECT EmployeeId FROM EmployeesProjects
					WHERE EmployeeID = @emloyeeId AND ProjectID = @projectID)
	BEGIN
		INSERT INTO EmployeesProjects(EmployeeID, ProjectID)
		VALUES(@emloyeeId, @projectID)
	END

	COMMIT

EXEC usp_AssignProject 3, 5

SELECT * FROM EmployeesProjects
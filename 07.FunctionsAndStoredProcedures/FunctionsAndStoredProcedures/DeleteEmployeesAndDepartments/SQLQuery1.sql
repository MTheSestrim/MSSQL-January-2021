CREATE PROC usp_DeleteEmployeesFromDepartment (@departmendID INT)
AS
ALTER TABLE Departments 
ALTER COLUMN ManagerID INT NULL

DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (SELECT EmployeeID FROM Employees 
		WHERE DepartmentID =  @departmendID)

UPDATE Employees
	SET ManagerID = NULL
	WHERE EmployeeID IN (SELECT EmployeeID FROM Employees 
		WHERE DepartmentID =  @departmendID)

UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN (SELECT EmployeeID FROM Employees 
		WHERE DepartmentID =  @departmendID)

UPDATE Departments
	SET ManagerID = NULL
	WHERE DepartmentID = @departmendID

DELETE FROM Employees 
	WHERE DepartmentID =  @departmendID

DELETE FROM Departments WHERE DepartmentID = @departmendID

SELECT COUNT(*) FROM Employees WHERE DepartmentID = @departmendID

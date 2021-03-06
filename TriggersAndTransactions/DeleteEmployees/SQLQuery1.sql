CREATE TABLE Deleted_Employees
(
	EmployeeId INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	MiddleName VARCHAR(50),
	JobTitle VARCHAR(50) NOT NULL,
	DepartmentId INT NOT NULL,
	Salary MONEY NOT NULL
)

CREATE TRIGGER tr_DeleteEmployee
ON Employees FOR DELETE
AS
	INSERT INTO 
	Deleted_Employees(FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary)
	SELECT FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary FROM deleted

DELETE FROM Employees
	WHERE EmployeeID = 3

SELECT * FROM Deleted_Employees
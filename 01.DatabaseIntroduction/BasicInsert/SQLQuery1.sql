INSERT INTO Towns([Name])
VALUES('Sofia');
INSERT INTO Towns([Name])
VALUES('Plovdiv');
INSERT INTO Towns([Name])
VALUES('Varna');
INSERT INTO Towns([Name])
VALUES('Burgas');

INSERT INTO Departments([Name])
VALUES('Engineering');
INSERT INTO Departments([Name])
VALUES('Sales');
INSERT INTO Departments([Name])
VALUES('Marketing');
INSERT INTO Departments([Name])
VALUES('Software Development');
INSERT INTO Departments([Name])
VALUES('Quality Assurance');

--ALTER TABLE Employees
--ALTER COLUMN AddressId int NULL;

INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
VALUES('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00);
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
VALUES('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00);
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
VALUES('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25);
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
VALUES('Georgi', 'Teziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00);
INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
VALUES('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

CREATE DATABASE SoftUni;

USE SoftUni;

CREATE TABLE Towns(
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL
)

CREATE TABLE Addresses(
	Id int IDENTITY(1,1) PRIMARY KEY,
	AddressText nvarchar(100) NOT NULL,
	TownId int FOREIGN KEY REFERENCES Towns(Id) NOT NULL
)

CREATE TABLE Departments(
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL
)

CREATE TABLE Employees(
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	MiddleName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	JobTitle nvarchar(50) NOT NULL,
	DepartmentId int FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
	HireDate DATE NOT NULL,
	Salary float(2) NOT NULL,
	AddressId int FOREIGN KEY REFERENCES Addresses(Id) NOT NULL
)

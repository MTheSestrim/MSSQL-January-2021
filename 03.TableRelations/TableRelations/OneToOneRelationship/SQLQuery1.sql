CREATE TABLE Passports 
(
	PassportID int PRIMARY KEY IDENTITY (101,1),
	PassportNumber char(8)
)

CREATE TABLE Persons 
(
	PersonID int PRIMARY KEY IDENTITY,
	FirstName nvarchar(50),
	Salary float(2),
	PassportID int UNIQUE

	CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportID) REFERENCES Passports (PassportID)
)


INSERT INTO Passports(PassportNumber)
VALUES ('N34FG21B'), ('K65LO4R7'), ('ZE657QP2')

INSERT INTO Persons(FirstName, Salary, PassportID)
VALUES ('Roberto', 43300.00, 102), 
('Tom', 56100.00, 103), 
('Yana', 60200.00, 101)

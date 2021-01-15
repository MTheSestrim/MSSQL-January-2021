CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE Employees (
	Id int NOT NULL PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Title varchar(50),
	Notes nvarchar(MAX)
)

CREATE TABLE Customers(
	AccountNumber varchar(10) NOT NULL PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	PhoneNumber varchar(10),
	EmergencyName nvarchar(50),
	EmergencyNumber varchar(10),
	Notes nvarchar(MAX)
)

CREATE TABLE RoomStatus (
	RoomStatus varchar(30) NOT NULL PRIMARY KEY,
	Notes nvarchar(MAX),
)

CREATE TABLE RoomTypes (
	RoomType varchar(30) NOT NULL PRIMARY KEY,
	Notes nvarchar(MAX)
)

CREATE TABLE BedTypes (
	BedType varchar(30) NOT NULL PRIMARY KEY,
	Notes nvarchar(MAX)
)

CREATE TABLE Rooms(
	RoomNumber varchar(10) NOT NULL PRIMARY KEY,
	RoomType varchar(30) NOT NULL,
	BedType varchar(30) NOT NULL,
	Rate float(2),
	RoomStatus varchar(30) NOT NULL,
	Notes nvarchar(MAX)
)

CREATE TABLE Payments(
	Id int NOT NULL PRIMARY KEY,
	EmployeeId int NOT NULL,
	PaymentDate DATE NOT NULL,
	AccountNumber varchar(10),
	FirstDateOccupied DATE,
	LastDateOccupied DATE,
	TotalDays tinyint,
	AmountCharged float(2) NOT NULL,
	TaxRate float(2),
	TaxAmount float(2),
	PaymentTotal float(2),
	Notes nvarchar(MAX)
)

CREATE TABLE Occupancies(
	Id int NOT NULL PRIMARY KEY,
	EmployeeId int NOT NULL,
	DateOccupied DATE NOT NULL,
	AccountNumber varchar(10) NOT NULL,
	RoomNumber varchar(3) NOT NULL,
	RateApplied float(2) NOT NULL,
	PhoneCharge float(2),
	Notes nvarchar(MAX)
)

INSERT INTO Employees(Id, FirstName, LastName, Title, Notes)
Values (1, 'Yavin', 'Yanin', 'Manager', 'Best manager.');
INSERT INTO Employees(Id, FirstName, LastName, Title)
Values (2, 'Yokin', 'Ronin', 'Assistant Manager.');
INSERT INTO Employees(Id, FirstName, LastName)
Values (3, 'Somanin', 'Serotonin');

INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
Values ('128129', 'Marin1', 'Marinov1', '0888888', 'ExtraM1', '01111111', 'Somebody.');
INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber)
Values ('1281124', 'Marin2', 'Marinov2', '0777777', 'ExtraM2', '0222222');
INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName)
Values ('11249', 'Marin3', 'Marinov3', '0333333', 'ExtraM3');

INSERT INTO RoomStatus(RoomStatus, Notes)
Values ('Taken', 'Cannot take it.');
INSERT INTO RoomStatus(RoomStatus)
Values ('Disputed');
INSERT INTO RoomStatus(RoomStatus)
Values ('Free');

INSERT INTO RoomTypes(RoomType, Notes)
Values ('Small', 'Only 2 people can fit in here.');
INSERT INTO RoomTypes(RoomType)
Values ('Medium');
INSERT INTO RoomTypes(RoomType)
Values ('Large');

INSERT INTO BedTypes(BedType, Notes)
Values ('Small', 'Solo.');
INSERT INTO BedTypes(BedType)
Values ('Medium');
INSERT INTO BedTypes(BedType)
Values ('Large');

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
Values ('1A', 'Small', 'Small', 25.50, 'Taken', 'Small Room');
INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus)
Values ('1B', 'Medium', 'Medium', 50, 'Disputed');
INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus)
Values ('1C', 'Large', 'Large', 100, 'Free');

INSERT INTO Payments(Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, 
TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
Values (1, 1, '02/02/2020', '128129', '02/04/2020', '02/07/2020', 3, 299.99, 0, 0, 299.99, 'Very cheap room.');
INSERT INTO Payments(Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, 
TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal)
Values (2, 2, '03/02/2020', '1281124', '03/04/2020', '03/07/2020', 3, 299.99, 0, 0, 299.99);
INSERT INTO Payments(Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, 
TotalDays, AmountCharged)
Values (3, 3, '04/02/2020', '11249', '04/04/2020', '04/07/2020', 3, 299.99);

INSERT INTO Occupancies(Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
Values (1, 1, '02/02/2020', '128129', '1A', 25.50, 0, 'Very cheap room.');
INSERT INTO Occupancies(Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge)
Values (2, 2, '03/02/2020', '1281124', '1B', 50, 10.33);
INSERT INTO Occupancies(Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied)
Values (3, 3, '04/02/2020', '11249', '1C', 100);
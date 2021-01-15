CREATE DATABASE CarRental;

USE CarRental;

CREATE TABLE Categories(
	Id int NOT NULL PRIMARY KEY,
	CategoryName nvarchar(50) NOT NULL,
	DailyRate float(2),
	WeeklyRate float(2),
	MonthlyRate float(2),
	WeekendRate float(2)
)

CREATE TABLE Cars(
	Id int NOT NULL PRIMARY KEY,
	PlateNumber varchar(10) NOT NULL,
	Manufacturer nvarchar(50) NOT NULL,
	Model nvarchar(50) NOT NULL,
	CarYear DATE NOT NULL,
	CategoryId int NOT NULL,
	Doors tinyint,
	Picture nvarchar(MAX),
	Condition nvarchar(100),
	Available bit NOT NULL
)

CREATE TABLE Employees(
	Id int NOT NULL PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Title nvarchar(50),
	Notes nvarchar(MAX)
)


CREATE TABLE Customers(
	Id int NOT NULL PRIMARY KEY,
	DriverLicenseNumber varchar(10) NOT NULL,
	FullName nvarchar(50) NOT NULL,
	[Address] nvarchar(50),
	City nvarchar(50),
	ZIPCode varchar(4),
	Notes nvarchar(MAX)
)

CREATE TABLE RentalOrders(
	Id int NOT NULL PRIMARY KEY,
	EmployeeId int NOT NULL,
	CustomerId int NOT NULL,
	CarId int NOT NULL,
	TankLevel int,
	KilometrageStart int,
	KilometrageEnd int,
	TotalKilometrage int,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays tinyint,
	RateApplied float(2),
	TaxRate float(2),
	OrderStatus varchar(50),
	Notes nvarchar(MAX)
)

INSERT INTO Categories(Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
Values (1, 'Sedan', 3.2, 2.3, 2.2, 2.1);
INSERT INTO Categories(Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate)
Values (2, 'Coupé', 3.5, 2.5, 2.4);
INSERT INTO Categories(Id, CategoryName, DailyRate, WeeklyRate)
Values (3, 'SUV', 4.2, 4.3);

INSERT INTO Cars(Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
Values (1, '8129498', 'Volkswagen', 'Golf 125012580125', '2006', 1, 4, 'Pic1.jpg', 'Pretty good.', 1);
INSERT INTO Cars(Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture,  Available)
Values (2, '125125125', 'Ferrari', 'HorseyHorse', '2016', 2, 2, 'Pic2.jpg', 0);
INSERT INTO Cars(Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Available)
Values (3, '232323', 'Nissan', 'BigBoi', '2010', 3, 4, 1);

INSERT INTO Employees(Id, FirstName, LastName, Title, Notes)
Values (1, 'Ivan', 'Ivanovski', 'Manager', 'Good at his job.');
INSERT INTO Employees(Id, FirstName, LastName, Title)
Values (2, 'Martin', 'Martinovski', 'Assistant Manager');
INSERT INTO Employees(Id, FirstName, LastName)
Values (3, 'Marian', 'Marianski');

INSERT INTO Customers(Id, DriverLicenseNumber, FullName, [Address], City, ZIPCode, Notes)
Values (1, '000000', 'Driver1', 'Address1', 'Sofia', '1000', 'Good guy.');
INSERT INTO Customers(Id, DriverLicenseNumber, FullName, [Address], City, ZIPCode)
Values (2, '000001', 'Driver2', 'Address2', 'Sofia', '1000');
INSERT INTO Customers(Id, DriverLicenseNumber, FullName, [Address], City)
Values (3, '000002', 'Driver3', 'Address3', 'Sofia');

INSERT INTO RentalOrders(Id, EmployeeId, CustomerId, CarId, TankLevel, 
KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, 
RateApplied, TaxRate, OrderStatus, Notes)
Values (1, 1, 1, 1, 1000, 0, 200, 200, '02/02/2020', '02/03/2020', 1, 2.3, 2.3, 'Rented', 'Not broken.');
INSERT INTO RentalOrders(Id, EmployeeId, CustomerId, CarId, TankLevel, 
KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, 
RateApplied, TaxRate, OrderStatus)
Values (2, 2, 2, 2, 1000, 0, 300, 300, '02/02/2020', '02/03/2020', 1, 2.4, 2.4, 'Rented');
INSERT INTO RentalOrders(Id, EmployeeId, CustomerId, CarId, TankLevel, 
KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, 
RateApplied, TaxRate)
Values (3, 3, 3, 3, 1000, 0, 250, 250, '02/02/2020', '02/03/2020', 1, 2.4, 2.4);
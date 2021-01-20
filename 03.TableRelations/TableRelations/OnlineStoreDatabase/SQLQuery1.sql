CREATE DATABASE OnlineStore;

CREATE TABLE Cities
(
	CityID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL
)

CREATE TABLE Customers
(
	CustomerID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL,
	Birthday DATE,
	CityID int FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE Orders
(
	OrderID int PRIMARY KEY IDENTITY,
	CustomerID int NOT NULL FOREIGN KEY REFERENCES Customers (CustomerID)
)

CREATE TABLE ItemTypes
(
	ItemTypeID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL
)

CREATE TABLE Items
(
	ItemID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL,
	ItemTypeID int NOT NULL FOREIGN KEY REFERENCES ItemTypes(ItemTypeID) 
)

CREATE TABLE OrderItems
(
	OrderID int NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
	ItemID int NOT NULL FOREIGN KEY REFERENCES Items(ItemID),

	CONSTRAINT PK_OrderItems PRIMARY KEY (OrderID, ItemID)
)




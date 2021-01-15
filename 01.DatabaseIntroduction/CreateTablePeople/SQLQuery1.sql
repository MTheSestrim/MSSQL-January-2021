CREATE TABLE People (
	Id bigint IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(200) NOT NULL,
	Picture varbinary(2000),
	Height float(2),
	Weight float(2),
	Gender char(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography nvarchar(MAX)
)

INSERT INTO People (Name, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Martin', 300.5, 300.5, 'm', '2000-02-02', 'Best rapper alive.');

INSERT INTO People (Name, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Till', 4.5, 12.5, 'm', '2020-02-02', 'Best singer alive.');

INSERT INTO People (Name, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Philie Pie', 100, 100, 'f', '2000-02-02', 'Best rapperess alive.');

INSERT INTO People (Name, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Anna', 12.5, 13.5, 'f', '2000-02-02', 'Some girl.');

INSERT INTO People (Name, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Ashton', 12.5, 3.5, 'a', '2000-02-02', 'Someone.');
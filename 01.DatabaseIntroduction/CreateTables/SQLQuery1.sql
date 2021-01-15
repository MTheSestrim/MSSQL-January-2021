USE Minions;

CREATE TABLE Minions(
	Id int NOT NULL,
	Name nvarchar(50) NOT NULL,
	Age tinyint,
	PRIMARY KEY (ID)
)

CREATE TABLE Towns(
	Id int NOT NULL,
	Name nvarchar(50) NOT NULL,
	PRIMARY KEY (ID)
)
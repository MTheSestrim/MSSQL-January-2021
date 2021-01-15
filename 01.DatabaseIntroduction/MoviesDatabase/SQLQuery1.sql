CREATE TABLE Directors(
	Id int NOT NULL PRIMARY KEY,
	DirectorName nvarchar(50) NOT NULL,
	Notes nvarchar(MAX)
)

CREATE TABLE Genres(
	Id int NOT NULL PRIMARY KEY,
	GenreName nvarchar(50) NOT NULL,
	Notes nvarchar(MAX)
)

CREATE TABLE Categories(
	Id int NOT NULL PRIMARY KEY,
	CategoryName nvarchar(50) NOT NULL,
	Notes nvarchar(MAX)
)

CREATE TABLE Movies(
	Id int NOT NULL PRIMARY KEY,
	Title nvarchar(50) NOT NULL,
	DirectorId int NOT NULL,
	CopyrightYear DATE,
	Length TIME,
	GenreId int NOT NULL,
	CategoryId int NOT NULL,
	Rating float(1),
	Notes nvarchar(MAX)
)

INSERT INTO Directors(Id, DirectorName, Notes)
Values (1, 'Peter Jackson', 'Pretty good.')
INSERT INTO Directors(Id, DirectorName, Notes)
Values (2, 'Steven Spielberg', 'Classic.')
INSERT INTO Directors(Id, DirectorName)
Values (3, 'Sam Raimi')
INSERT INTO Directors(Id, DirectorName)
Values (4, 'NobodyKnowsMe')
INSERT INTO Directors(Id, DirectorName, Notes)
Values (5, 'StillOnTheGrind', 'Some day.')

INSERT INTO Genres(Id, GenreName, Notes)
Values (1, 'Fantasy', 'Good stuff.')
INSERT INTO Genres(Id, GenreName, Notes)
Values (2, 'Sci-fi', 'Space and future stuff.')
INSERT INTO Genres(Id, GenreName)
Values (3, 'Thriller.')
INSERT INTO Genres(Id, GenreName)
Values (4, 'Horror.')
INSERT INTO Genres(Id, GenreName, Notes)
Values (5, 'Crime', 'Some of the best movies here tbh.')

INSERT INTO Categories(Id, CategoryName, Notes)
Values (1, 'Category1', 'Notes1.')
INSERT INTO Categories(Id, CategoryName, Notes)
Values (2, 'Category2', 'Notes2.')
INSERT INTO Categories(Id, CategoryName)
Values (3, 'Category3.')
INSERT INTO Categories(Id, CategoryName)
Values (4, 'Category4.')
INSERT INTO Categories(Id, CategoryName, Notes)
Values (5, 'Category5', 'Notes3.')

INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
Values (1, 'Lord of the Rings: The Return of the King', 1, '2000', '3:00:00', 1, 1, 10, 'Incorrect values.');
INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating)
Values (2, 'ET-E', 2, '1980', '2:00:00', 2, 2, 8.3);
INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId)
Values (3, 'Evil Dead.', 3, '1970', '1:30:00', 3, 3);
INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, GenreId, CategoryId)
Values (4, 'The Invisible Person.', 4, '2030', 4, 5);
INSERT INTO Movies(Id, Title, DirectorId, GenreId, CategoryId)
Values (5, 'Get Dead or Rich Trying', 5, 5, 5);
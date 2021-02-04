-- Query 1 (Submit)
CREATE TABLE Monasteries (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL,
	CountryCode CHAR(2) NOT NULL,
	CONSTRAINT FK_MonasteryCountry 
	FOREIGN KEY (CountryCode) REFERENCES Countries (CountryCode)
)

-- Query 2 (Submit)
INSERT INTO Monasteries(Name, CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('Sümela Monastery', 'TR')

--
-- Query 3 (Don't submit)
--
--ALTER TABLE Countries
--ADD IsDeleted Bit NOT NULL
--CONSTRAINT D_Countries_IsDeleted DEFAULT (0)


-- Query 4 (Submit)
UPDATE Countries 
	SET IsDeleted = 1
	WHERE CountryCode IN (SELECT coun.CountryCode
	FROM Countries coun
	JOIN CountriesRivers cr ON coun.CountryCode = cr.CountryCode
	JOIN Rivers r ON cr.RiverId = r.Id
	GROUP BY coun.CountryCode
	HAVING COUNT(r.Id) > 3) 

-- Query 5 (Submit)
SELECT m.[Name], coun.[CountryName]
	FROM Monasteries m
	JOIN Countries coun ON coun.CountryCode = m.CountryCode
	WHERE coun.IsDeleted = 0
	ORDER BY m.[Name]
-- Submit all
--
-- Query 1

UPDATE Countries
	SET CountryName = 'Burma'
	WHERE CountryName = 'Myanmar'

-- Query 2
--
-- TZ is Tanzania's CountryCode

INSERT INTO Monasteries([Name], CountryCode) 
VALUES ('Hanga Abbey', (SELECT CountryCode FROM Countries WHERE CountryName = 'Tanzania'))

-- Query 3
--
--

INSERT INTO Monasteries([Name], CountryCode) 
VALUES ('Myin-Tin-Daik', (SELECT CountryCode FROM Countries WHERE CountryName = 'Myanmar'))

-- Query 4

SELECT con.ContinentName, coun.CountryName, COUNT(m.Id) AS MonasteriesCount
	FROM Continents con
	JOIN Countries coun ON coun.ContinentCode = con.ContinentCode
	LEFT JOIN Monasteries m ON m.CountryCode = coun.CountryCode
	WHERE coun.IsDeleted = 0
	GROUP BY con.ContinentName, coun.CountryName
	ORDER BY COUNT(m.Id) DESC, coun.CountryName ASC
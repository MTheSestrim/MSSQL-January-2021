SELECT p.PeakName, m.MountainRange AS Mountain, coun.CountryName, con.ContinentName
	FROM Peaks AS p
	JOIN Mountains m ON m.Id = p.MountainId
	JOIN MountainsCountries mc ON mc.MountainId = m.Id
	JOIN Countries coun ON coun.CountryCode = mc.CountryCode
	JOIN Continents con ON con.ContinentCode = coun.ContinentCode
	ORDER BY p.PeakName ASC, coun.CountryName ASC
SELECT coun.CountryName, con.ContinentName, 
	COUNT(r.RiverName) AS RiversCount, ISNULL(SUM(r.[Length]), 0) AS TotalLength
	FROM Countries coun
	JOIN Continents con ON con.ContinentCode = coun.ContinentCode
	LEFT JOIN CountriesRivers counr ON counr.CountryCode = coun.CountryCode
	LEFT JOIN Rivers r ON r.Id = counr.RiverId
	GROUP BY coun.CountryName, con.ContinentName
	ORDER BY COUNT(r.RiverName) DESC, SUM(r.[Length]) DESC, coun.CountryName ASC
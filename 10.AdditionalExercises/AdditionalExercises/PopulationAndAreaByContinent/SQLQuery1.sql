SELECT con.ContinentName, 
	SUM(CAST(coun.AreaInSqKm AS BIGINT)) AS CountriesArea, 
	SUM(CAST(coun.[Population] AS BIGINT)) AS CountriesPopulation
	FROM Continents con
	JOIN Countries coun ON coun.ContinentCode = con.ContinentCode
	GROUP BY con.ContinentName
	ORDER BY CountriesPopulation DESC
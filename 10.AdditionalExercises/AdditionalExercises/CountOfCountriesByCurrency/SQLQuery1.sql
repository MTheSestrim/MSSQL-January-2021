SELECT cu.CurrencyCode, cu.[Description] AS Currency, 
	COUNT(coun.CountryCode) AS NumberOfCountries
	FROM Currencies cu
	LEFT JOIN Countries coun ON coun.CurrencyCode = cu.CurrencyCode
	GROUP BY cu.CurrencyCode, cu.[Description]
	ORDER BY COUNT(coun.CountryCode) DESC, cu.[Description] ASC

	SELECT * FROM Currencies ORDER BY [Description] ASC
SELECT TOP(5) c.CountryName AS Country, ISNULL(p.PeakName, '(no highest peak)') AS HighestPeakName, 
	ISNULL(MAX(p.Elevation), 0) AS HighestPeakElevation, 
	ISNULL(m.MountainRange, '(no mountain)') AS Mountain
	FROM Countries c
	LEFT JOIN MountainsCountries mc ON mc.CountryCode = c.CountryCode
	LEFT JOIN Mountains m ON m.Id = mc.MountainId
	LEFT JOIN Peaks p ON p.MountainId = m.Id
	GROUP BY c.CountryName, p.PeakName, m.MountainRange
	ORDER BY c.CountryName ASC, p.PeakName ASC;
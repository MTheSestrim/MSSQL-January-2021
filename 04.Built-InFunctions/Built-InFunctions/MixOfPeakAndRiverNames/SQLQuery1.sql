SELECT PeakName, RiverName,
	LOWER(LEFT(PeakName, LEN (PeakName) - 1) + RiverName) AS Mix
	FROM Peaks
	INNER JOIN Rivers ON Right(PeakName, 1) = Left(RiverName, 1)
	ORDER BY Mix;
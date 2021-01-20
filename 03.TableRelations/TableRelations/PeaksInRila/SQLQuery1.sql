USE Geography;

SELECT m.MountainRange, p.PeakName, p.Elevation 
	FROM Peaks as p
	JOIN Mountains AS m on p.MountainId = m.Id
	WHERE MountainRange = 'Rila'
	ORDER BY Elevation DESC;
--USE Geography

SELECT p.PeakName, m.MountainRange AS Mountain, p.Elevation
	FROM Peaks p
	JOIN Mountains m ON m.Id = p.MountainId
	ORDER BY p.Elevation DESC, p.PeakName ASC
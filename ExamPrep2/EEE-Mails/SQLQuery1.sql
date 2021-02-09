SELECT a.FirstName, a.LastName, 
	FORMAT(a.BirthDate, 'MM-dd-yyyy') AS BirthDate, c.[Name] AS Hometown, a.Email
	FROM Accounts a
	JOIN Cities c ON c.Id = a.CityId
	WHERE LEFT(a.Email, 1) = 'e'
	ORDER BY Hometown
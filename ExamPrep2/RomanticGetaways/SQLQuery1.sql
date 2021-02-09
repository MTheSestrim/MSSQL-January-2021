SELECT a.Id, a.Email, ca.[Name] AS City, COUNT(t.Id) AS Trips
	FROM Accounts a
	JOIN Cities ca ON ca.Id = a.CityId
	JOIN AccountsTrips at ON at.AccountId = a.Id
	JOIN Trips t ON t.Id = at.TripId
	JOIN Rooms r ON r.Id = t.RoomId
	JOIN Hotels h ON h.Id = r.HotelId
	JOIN Cities ch ON ch.Id = h.CityId
	WHERE ch.Id = ca.Id
	GROUP BY a.Id, a.Email, ca.[Name]
	ORDER BY Count(t.Id) DESC, a.Id

SELECT t.Id, a.FirstName + ' ' + ISNULL(a.MiddleName + ' ', '') + a.LastName AS [Full Name],
	ca.[Name] AS [From], ch.[Name] AS [To],
	IIF(t.CancelDate IS NULL, 
	CAST(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate) AS VARCHAR) + ' days', 
	'Canceled') AS Duration
	FROM Trips t
	JOIN AccountsTrips atr ON atr.TripId = t.Id
	JOIN Accounts a ON a.Id = atr.AccountId
	JOIN Cities ca ON ca.Id = a.CityId
	JOIN Rooms r ON r.Id = t.RoomId
	JOIN Hotels h ON h.Id = r.HotelId
	JOIN Cities ch ON ch.Id = h.CityId
	ORDER BY [Full Name], t.Id
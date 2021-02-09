CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	IF EXISTS(SELECT TOP(1) (h.BaseRate + r.Price) * @People
		FROM Hotels h
		JOIN Rooms r ON r.HotelId = h.Id
		WHERE h.Id = @HotelId AND 
		NOT EXISTS (SELECT * FROM Trips t WHERE t.RoomId = r.Id
											AND t.CancelDate IS NULL
											AND @Date BETWEEN ArrivalDate AND ReturnDate)
		AND r.Beds >= @People
		ORDER BY (h.BaseRate + r.Price) * @People DESC)
	BEGIN
		RETURN (SELECT TOP(1)
		'Room ' + CAST(r.Id AS NVARCHAR) + ': ' 
		+ r.[Type] + ' (' + CAST(r.Beds AS NVARCHAR) + ' beds) - $' 
		+ CAST((h.BaseRate + r.Price) * @People AS NVARCHAR)
		FROM Hotels h
		JOIN Rooms r ON r.HotelId = h.Id
		WHERE h.Id = @HotelId AND 
		NOT EXISTS (SELECT * FROM Trips t WHERE t.RoomId = r.Id
											AND t.CancelDate IS NULL
											AND @Date BETWEEN ArrivalDate AND ReturnDate)
		AND r.Beds >= @People
		ORDER BY (h.BaseRate + r.Price) * @People DESC)
	END

	RETURN 'No rooms available'
END

SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)
SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)
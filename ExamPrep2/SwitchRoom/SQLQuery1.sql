CREATE PROC usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
	DECLARE @HotelIdRoom INT = (SELECT TOP(1) HotelId 
									FROM Rooms r 
									JOIN Hotels h ON h.Id = r.HotelId
									WHERE r.Id = @TargetRoomId)
	DECLARE @HotelIdTrip INT = (SELECT TOP(1) HotelId 
									FROM Trips t
									JOIN Rooms r ON r.Id = t.RoomId 
									JOIN Hotels h ON h.Id = r.HotelId
									WHERE t.Id = @TripId)
	/*
	If the target room ID is in a different hotel, than the trip is in, 
	raise an exception with the message “Target room is in another hotel!”.
	*/
	IF(@HotelIdRoom <> @HotelIdTrip)
		THROW 50001, 'Target room is in another hotel!', 1

	DECLARE @RoomBeds INT = (SELECT Beds 
									FROM Rooms 
									WHERE Id = @TargetRoomId)

	DECLARE @NecessaryBeds INT = (SELECT COUNT(atr.AccountId)
									FROM Trips t
									JOIN AccountsTrips atr ON atr.TripId = t.Id
									WHERE t.Id = @TripId)
	
	/*
	If the target room doesn’t have enough beds for all the trip’s accounts, 
	raise an exception with the message “Not enough beds in target room!”.
	*/

	IF(@RoomBeds < @NecessaryBeds)
		THROW 50002, 'Not enough beds in target room!', 1

	UPDATE Trips
		SET RoomId = @TargetRoomId
		WHERE Id = @TripId

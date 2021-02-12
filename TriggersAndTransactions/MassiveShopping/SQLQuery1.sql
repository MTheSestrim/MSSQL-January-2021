-- Id = 9
--SELECT * FROM Users WHERE Username = 'Stamat'
-- Id = 87
--SELECT * FROM Games WHERE Name = 'Safflower'

DECLARE @UserGameId INT = (SELECT Id FROM UsersGames WHERE UserId = 9 AND GameId = 87)

DECLARE @FirstCost DECIMAL(15,2) = (SELECT SUM(Price) FROM Items WHERE MinLevel IN(11, 12))

IF (@FirstCost <= (SELECT Cash FROM UsersGames WHERE Id = @UserGameId))
BEGIN
	BEGIN TRANSACTION
	UPDATE UsersGames
	SET Cash -= @FirstCost
	WHERE Id = @UserGameId
	
	INSERT INTO UserGameItems (UserGameId, ItemId)
	SELECT @UserGameId, Id FROM Items WHERE MinLevel IN (11, 12)
	COMMIT
END

DECLARE @SecondCost DECIMAL(15,2) = (SELECT SUM(Price) FROM Items WHERE MinLevel IN(19, 20, 21))

IF (@SecondCost <= (SELECT Cash FROM UsersGames WHERE Id = @UserGameId))
BEGIN
	BEGIN TRANSACTION
		UPDATE UsersGames
		SET Cash -= @SecondCost
		WHERE Id = @UserGameId

		INSERT INTO UserGameItems (UserGameId, ItemId)
		SELECT @UserGameId, Id FROM Items WHERE MinLevel IN (19, 20, 21)
	COMMIT
END

SELECT i.[Name]
	FROM UsersGames ug
	JOIN UserGameItems ugi ON ugi.UserGameId = ug.Id
	JOIN Items i ON i.Id = ugi.ItemId
	WHERE ug.Id = @UserGameId
	ORDER BY i.[Name]

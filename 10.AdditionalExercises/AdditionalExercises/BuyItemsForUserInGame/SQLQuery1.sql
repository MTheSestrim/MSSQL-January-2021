-- Id IN (51, 71, 157, 184, 197, 223)) -> Ids for respective items
--
-- Pay for items
UPDATE UsersGames
	SET Cash -= (SELECT SUM(Price)
		FROM Items
		WHERE Id IN (51, 71, 157, 184, 197, 223))
	WHERE UserId = (SELECT Id FROM Users WHERE Username = 'Alex') 
		AND GameId = (SELECT Id FROM Games WHERE [Name] = 'Edinburgh')
--
-- UserGameId is 235 -> Found through this query
--
--SELECT * 
--	FROM UsersGames 
--	WHERE UserId = (SELECT Id FROM Users WHERE Username = 'Alex') 
--	AND GameId = (SELECT Id FROM Games WHERE [Name] = 'Edinburgh')

INSERT INTO UserGameItems (ItemId, UserGameId)
	VALUES (51, 235), (71, 235), (157, 235),
	(184, 235), (197, 235), (223, 235)

-- SELECT query
SELECT u.Username, g.[Name], ug.Cash, i.[Name] AS [Item Name]
	FROM Users u
	JOIN UsersGames ug ON ug.UserId = u.Id
	JOIN Games g ON g.Id = ug.GameId
	JOIN UserGameItems ugi ON ugi.UserGameId = ug.Id
	JOIN Items i ON i.Id = ugi.ItemId
	WHERE g.[Name] = 'Edinburgh'
	ORDER BY [Item Name]
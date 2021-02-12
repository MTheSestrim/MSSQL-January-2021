-- USE Diablo
-- !!!DEBUG ONLY!!!
-- USE SOFTUNI
-- DROP DATABASE DIABLO
-- (Recreate Diablo)
-- !!!DEBUG ONLY!!!
/*
1. Users should not be allowed to buy items with higher level than their level. 
Create a trigger that restricts that. 
The trigger should prevent inserting items that are above specified level 
while allowing all others to be inserted.
*/

CREATE TRIGGER tr_InsertHigherLevelItems
ON UserGameItems INSTEAD OF INSERT
AS
	DECLARE @ItemId INT = (SELECT ItemId FROM inserted)
	DECLARE @userGameId INT = (SELECT UserGameId FROM inserted)

	DECLARE @ItemLevel INT = (SELECT MinLevel
							FROM Items
							WHERE Id = @itemId)
	DECLARE @CharacterLevel INT = (SELECT Level
							FROM UsersGames
							WHERE Id = @userGameId)
	IF(@CharacterLevel >= @ItemLevel)
	BEGIN
	INSERT INTO UserGameItems (ItemId, UserGameId)
	VALUES (@ItemId, @userGameId)
	END

/*
2. Add bonus cash of 50000 to users: 
baleremuda, loosenoise, inguinalself, buildingdeltoid, monoxidecos in the game "Bali".
*/

UPDATE UsersGames
SET Cash += 50000
FROM UsersGames ug
	JOIN Users u ON u.Id = ug.UserId
	JOIN Games g ON g.Id = ug.GameId
	WHERE u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
	'buildingdeltoid', 'monoxidecos')
	AND g.[Name] = 'Bali'

/*
3. There are two groups of items that you must buy for the above users. 
The first are items with id between 251 and 299 including. 
Second group are items with id between 501 and 539 including.
Take off cash from each user for the bought items.
*/

CREATE PROC usp_CharacterBuyItem(@UserGameId INT, @ItemId INT)
AS
	BEGIN TRANSACTION
	DECLARE @CurrentCharacter INT = (SELECT Id FROM UsersGames WHERE Id = @UserGameId)
	DECLARE @CurrentItem INT = (SELECT Id FROM Items WHERE Id = @ItemId)

	IF(@CurrentCharacter IS NULL)
	BEGIN
		ROLLBACK;
		THROW 50001, 'User does not exist', 1;
		RETURN
	END
	
	IF(@CurrentItem IS NULL)
	BEGIN
		ROLLBACK;
		THROW 50002, 'Item does not exist', 1;
		RETURN;
	END
	
	DECLARE @ItemPrice DECIMAL(15,2) = (SELECT Price FROM Items WHERE Id = @ItemId)
	DECLARE @CharacterCash DECIMAL(15,2) = (SELECT Cash FROM UsersGames WHERE Id = @UserGameId)

	INSERT INTO UserGameItems(UserGameId, ItemId)
	VALUES (@UserGameId, @ItemId)

	IF EXISTS(SELECT * FROM UserGameItems WHERE UserGameId = @UserGameId AND ItemId = @ItemId)
	BEGIN
	UPDATE UsersGames
	SET Cash = @CharacterCash - @ItemPrice
	WHERE Id = @UserGameId
	END
	COMMIT

DECLARE @counter INT = 251;

WHILE(@counter <= 299)
BEGIN
	-- Hardcoded UserGameId values, look up in table
	EXEC usp_CharacterBuyItem 26, @counter
	EXEC usp_CharacterBuyItem 115, @counter
	EXEC usp_CharacterBuyItem 146, @counter
	EXEC usp_CharacterBuyItem 177, @counter
	EXEC usp_CharacterBuyItem 296, @counter

	SET @counter += 1
END

-- Execute seperately

DECLARE @counter INT = 501;

WHILE(@counter <= 539)
BEGIN
	-- Hardcoded UserGameId values, look up in table
	EXEC usp_CharacterBuyItem 26, @counter
	EXEC usp_CharacterBuyItem 115, @counter
	EXEC usp_CharacterBuyItem 146, @counter
	EXEC usp_CharacterBuyItem 177, @counter
	EXEC usp_CharacterBuyItem 296, @counter

	SET @counter += 1
END

/*
4. Select all users in the current game ("Bali") with their items. 
Display username, game name, cash and item name. 
Sort the result by username alphabetically, then by item name alphabetically. 
*/

SELECT u.Username, g.[Name], ug.Cash, i.[Name]
	FROM UsersGames ug
	JOIN Users u ON u.Id = ug.UserId
	JOIN UserGameItems ugi ON ugi.UserGameId = ug.Id
	JOIN Items i ON i.Id = ugi.ItemId
	JOIN Games g ON g.Id = ug.GameId
	WHERE u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
	'buildingdeltoid', 'monoxidecos')
	AND g.[Name] = 'Bali'
	ORDER BY u.Username ASC, i.[Name] ASC
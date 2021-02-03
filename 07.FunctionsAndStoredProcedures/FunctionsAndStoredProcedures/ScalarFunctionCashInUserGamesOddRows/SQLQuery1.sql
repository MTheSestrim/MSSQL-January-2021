CREATE FUNCTION ufn_CashInUsersGames(@GameName VARCHAR(100))
RETURNS @result TABLE (SumCash MONEY)
AS
BEGIN
	INSERT INTO @result SELECT Cash FROM (SELECT ug.Cash,g.[Name], ROW_NUMBER() OVER (ORDER BY Cash DESC) AS [RowNum]
		FROM UsersGames ug
		JOIN Games g ON g.ID = ug.GameId
		WHERE g.[Name] = @GameName) AS r
		WHERE [RowNum] % 2 = 1
	RETURN
END

--SELECT * FROM dbo.ufn_CashInUsersGames('Love in a mist')
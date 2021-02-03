CREATE PROC usp_GetTownsStartingWith 
	(@StartStr nvarchar(MAX)) --Task says starting with string, assume it's not a simple char -> reason for MAX
AS
	SELECT [Name]
		FROM Towns
		WHERE LEFT([Name], LEN(@StartStr)) = @StartStr

--EXEC usp_GetTownsStartingWith 'b'
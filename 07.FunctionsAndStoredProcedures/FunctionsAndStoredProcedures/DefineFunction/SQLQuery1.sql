CREATE FUNCTION ufn_IsWordComprised(@setOfLetters varchar(MAX), @word varchar(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @counter INT = 1
	WHILE @counter <= LEN(@word)
		BEGIN
			IF CHARINDEX(SUBSTRING(@word, @counter, 1), @setOfLetters) = 0
				RETURN 0;
			SET @counter += 1;
		END
	RETURN 1
END
--GO

--SELECT dbo.ufn_IsWordComprised('pppp', 'Guy') FROM Employees WHERE EmployeeID = 1;
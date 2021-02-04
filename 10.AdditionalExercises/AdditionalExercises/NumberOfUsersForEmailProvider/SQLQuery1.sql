--USE DIABLO

CREATE FUNCTION ufn_ExtractDomain(@Email NVARCHAR(50))
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @StartIndex INT
		SET @StartIndex = CHARINDEX('@', @Email) + 1
		RETURN SUBSTRING(@Email, @StartIndex, LEN(@Email) - @StartIndex + 1)
	END
--GO

SELECT dbo.ufn_ExtractDomain(Email) AS [Email Provider],
	COUNT(dbo.ufn_ExtractDomain(Email)) AS [Number Of Users]
	FROM Users
	GROUP BY dbo.ufn_ExtractDomain(Email)
	ORDER BY [Number Of Users] DESC, [Email Provider] ASC


--
-- Could not get code above to work in Judge. Below is one that does.
--
--SELECT SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email) + 1) AS [Email Provider],
--	COUNT(SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email) + 1)) AS [Number Of Users]
--	FROM Users
--	GROUP BY SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email) + 1)
--	ORDER BY [Number Of Users] DESC, [Email Provider] ASC
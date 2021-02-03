--USE Bank;

CREATE PROC usp_GetHoldersFullName
AS
	BEGIN
		SELECT FirstName + ' ' + LastName AS FullName
			FROM AccountHolders
	END
--GO

--EXEC usp_GetHoldersFullName
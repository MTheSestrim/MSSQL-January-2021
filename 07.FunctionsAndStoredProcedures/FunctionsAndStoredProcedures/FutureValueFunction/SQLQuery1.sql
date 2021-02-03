CREATE FUNCTION ufn_CalculateFutureValue
(@InitialSum DECIMAL(10,4), @YearlyInterestRate FLOAT, @NumberOfYears INT)
RETURNS DECIMAL(10, 4)
AS
	BEGIN
		DECLARE @FutureValue DECIMAL(10, 4);
		SET @FutureValue = @InitialSum * (POWER((1 + @YearlyInterestRate), @NumberOfYears));
		RETURN ROUND(@FutureValue, 4);
	END
--GO

--SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5) FROM AccountHolders WHERE Id = 1;
CREATE FUNCTION udf_GetCost(@jobId INT)
RETURNS DECIMAL(15,2)
AS
BEGIN
	DECLARE @result DECIMAL(15,2)
	SET @result = (SELECT SUM(p.Price * op.Quantity) AS TotalSum
		FROM Jobs j
		JOIN Orders o ON o.JobId = j.JobId
		JOIN OrderParts op ON op.OrderId = o.OrderId
		JOIN Parts p ON p.PartId = op.PartId
		WHERE j.JobId = @jobId
		GROUP BY j.JobId)

	IF(@result IS NULL)
	RETURN 0
	
	RETURN @result
END

SELECT dbo.udf_GetCost(1)
CREATE PROCEDURE usp_PlaceOrder(@jobId INT,	@partSerialNumber VARCHAR(50), @quantity INT)
AS
	IF (@quantity <= 0)
		THROW 50012, 'Part quantity must be more than zero!', 1;
	ELSE IF ((SELECT Count([Status]) FROM Jobs WHERE JobId = @jobId) = 0)
		THROW 50013, 'Job not found!' , 1;
	ELSE IF ((SELECT [Status] FROM Jobs WHERE JobId = @jobId) = 'Finished')
		THROW 50011, 'This job is not active!', 1;
	ELSE IF ((SELECT Count(SerialNumber) FROM Parts WHERE SerialNumber = @partSerialNumber) = 0)
		THROW 50014, 'Part not found!', 1;

	DECLARE @partId INT 
	SET @partId = (SELECT PartId FROM Parts WHERE SerialNumber = @partSerialNumber)

	DECLARE @orderId INT
	SELECT @orderId = o.OrderId FROM Orders o
		JOIN Jobs j ON j.JobId = o.JobId
		Join OrderParts op ON op.OrderId = o.OrderId
		WHERE o.IssueDate IS NULL AND j.JobId = @jobId AND op.PartId = @partId

	IF(@orderId IS NULL)
	BEGIN
		INSERT INTO Orders(JobId, IssueDate)
		VALUES (@jobId, NULL)

		SELECT @orderId = o.OrderId FROM Orders o
		JOIN Jobs j ON j.JobId = o.JobId
		WHERE o.IssueDate IS NULL AND j.JobId = @jobId

		INSERT INTO OrderParts(OrderId, PartId, Quantity)
		VALUES (@orderId, @partId, @quantity)
	END
	ELSE
	BEGIN
		UPDATE OrderParts
				SET Quantity += @quantity
				WHERE OrderId = @orderId AND PartId = @partId
	END

DECLARE @err_msg AS NVARCHAR(MAX);
BEGIN TRY
  EXEC usp_PlaceOrder 1, 'ZeroQuantity', 0
END TRY

BEGIN CATCH
  SET @err_msg = ERROR_MESSAGE();
  SELECT @err_msg
END CATCH


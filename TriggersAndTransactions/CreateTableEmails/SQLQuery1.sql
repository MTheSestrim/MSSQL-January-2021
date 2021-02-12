CREATE TABLE NotificationEmails
(
	Id INT PRIMARY KEY IDENTITY,
	Recipient INT NOT NULL REFERENCES Logs(LogId),
	[Subject] VARCHAR(250) NOT NULL,
	Body VARCHAR(300) NOT NULL
)

CREATE TRIGGER tr_AddToNotificationEmailsOnInsert
ON Logs FOR INSERT
AS
	INSERT INTO NotificationEmails(Recipient, [Subject], Body)
	(SELECT AccountId,
		CONCAT('Balance change for account: ', CAST(AccountId AS VARCHAR(50))),
		CONCAT('On ', FORMAT(GETDATE(), 'MMM dd yyyy hh:mmtt'),
		' your balance was changed from ', CAST(OldSum AS VARCHAR(50)),
		' to ', CAST(NewSum AS VARCHAR(50)),'.')
		FROM inserted)

UPDATE Accounts
SET Balance -= 10
WHERE Id = 1

SELECT * FROM NotificationEmails
	
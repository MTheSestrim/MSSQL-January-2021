ALTER TABLE Users ADD CONSTRAINT DF_LastLoginTime DEFAULT GETDATE() FOR LastLoginTime;

INSERT INTO Users(Username, Password)
VALUES('MS', 'Not that one');
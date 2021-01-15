CREATE TABLE Users (
	Id bigint IDENTITY(1,1) PRIMARY KEY,
	Username nchar(30) NOT NULL,
	Password char(26) NOT NULL,
	ProfilePicture varbinary(900),
	LastLoginTime DATETIME,
	IsDeleted BIT
)

INSERT INTO Users (Username, Password)
VALUES ('Martin22', '125789789');

INSERT INTO Users (Username, Password, LastLoginTime)
VALUES ('Ch3dder', 'LPTM', '2020-02-02');

INSERT INTO Users (Username, Password, IsDeleted)
VALUES ('PPPPPPPPPP', 'PPPPPPPPPPPPP', 1);

INSERT INTO Users (Username, Password, LastLoginTime, IsDeleted)
VALUES ('UpUpUp', 'DownDownDown', '2000-02-02', '0');

INSERT INTO Users (Username, Password)
VALUES ('Ashton', 'Petkan');
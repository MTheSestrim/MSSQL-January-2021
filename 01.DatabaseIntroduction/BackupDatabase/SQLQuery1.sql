BACKUP DATABASE SoftUni
  TO DISK = 'D:\MSSQLJanuary2021\01.DatabaseIntroduction\BackupDatabase\softuni-backup.bak'
	WITH FORMAT;
GO

USE master;
GO
ALTER DATABASE SoftUni SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE SoftUni;

RESTORE DATABASE SoftUni FROM DISK = 'D:\MSSQLJanuary2021\01.DatabaseIntroduction\BackupDatabase\softuni-backup.bak';
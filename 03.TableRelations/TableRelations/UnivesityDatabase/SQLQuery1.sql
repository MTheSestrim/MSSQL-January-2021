CREATE DATABASE University;

USE University;

CREATE TABLE Majors
(
	MajorID int PRIMARY KEY IDENTITY,
	[Name] varchar(50) NOT NULL
)

CREATE TABLE Students
(
	StudentID int PRIMARY KEY IDENTITY,
	StudentNumber varchar(50) NOT NULL,
	StudentName varchar(50) NOT NULL,
	MajorID int NOT NULL FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
	PaymentID int PRIMARY KEY IDENTITY,
	PaymentDate DATE NOT NULL,
	PaymentAmount float(2) NOT NULL,
	StudentID int NOT NULL FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Subjects
(
	SubjectID int PRIMARY KEY IDENTITY,
	SubjectDate varchar(50) NOT NULL,
)

CREATE TABLE Agenda
(
	StudentID int NOT NULL FOREIGN KEY REFERENCES Students(StudentID),
	SubjectID int NOT NULL FOREIGN KEY REFERENCES Subjects(SubjectID)

	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
)
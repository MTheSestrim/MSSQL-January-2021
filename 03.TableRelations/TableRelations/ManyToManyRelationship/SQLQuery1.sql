CREATE TABLE Students
(
	StudentID int PRIMARY KEY IDENTITY,
	[Name] varchar(50)
)

CREATE TABLE Exams
(
	ExamID int PRIMARY KEY IDENTITY(101, 1),
	[Name] varchar(50)
)

CREATE TABLE StudentsExams
(
	StudentID int,
	ExamID int 

	CONSTRAINT PK_StudentsExams PRIMARY KEY(StudentID, ExamID),
	CONSTRAINT FK_StudentsExams_Students FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
	CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams (ExamID)
)

INSERT INTO Students([Name])
VALUES ('Mila'), ('Toni'), ('Ron');

INSERT INTO Exams([Name])
VALUES ('SpringMVC'), ('Neo4j'), ('Oracle 11g');

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES (1, 101), (1, 102), (2, 101), (3, 103), (2, 102), (2, 103);
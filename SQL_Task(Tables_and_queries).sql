create table Trainees(
	Id int primary key identity,
	NationalId VARCHAR(20) UNIQUE NOT NULL,
	FullName NVARCHAR(100) NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Track NVARCHAR(50),
	EnrollmentDate DATE NOT NULL,
	IsActive BIT DEFAULT 1
);
Create table Instructors(
	Id int primary key identity,
	FullName varchar(50) Not Null,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Salary DECIMAL(10,2) CHECK (Salary > 0),
	HireDate DATE NOT NULL
);
CREATE TABLE Courses (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) UNIQUE NOT NULL,
    _Hours INT,
    Price DECIMAL(10,2) CHECK (Price > 0),
    MaxCapacity INT CHECK (MaxCapacity > 0)
);
CREATE TABLE CourseSessions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CourseId INT REFERENCES Courses(Id),
    InstructorId INT REFERENCES Instructors(Id),
    StartDate DATE,
    EndDate DATE,
    RoomNumber VARCHAR(20)
);
CREATE TABLE Enrollments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    TraineeId INT REFERENCES Trainees(Id),
    SessionId INT REFERENCES CourseSessions(Id),
    EnrollmentDate DATE,
    Grade DECIMAL CHECK (Grade BETWEEN 0 AND 100),
    _Status NVARCHAR(20) CHECK (_Status IN ('Enrolled', 'Completed', 'Cancelled')),
    CONSTRAINT Unique_Trainee_Session UNIQUE (TraineeId, SessionId)
);
CREATE TABLE Payments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentId INT REFERENCES Enrollments(Id),
    Amount DECIMAL(10,2) CHECK (Amount >= 0),
    PaymentDate DATETIME,
    PaymentMethod NVARCHAR(20) CHECK (PaymentMethod IN ('Cash', 'Card', 'Installment')),
    IsRefunded BIT DEFAULT 0
);
CREATE INDEX IX_Enrollments_TraineeId ON Enrollments(TraineeId);
-----------------------------------------------------------------------------------1
SELECT 
    C.Title AS CourseName,
    SUM(P.Amount) AS TotalRevenue,
    COUNT(E.Id) AS TotalEnrollments
FROM Courses C
JOIN CourseSessions CS ON C.Id = CS.CourseId
JOIN Enrollments E ON CS.Id = E.SessionId
JOIN Payments P ON E.Id = P.EnrollmentId
WHERE P.IsRefunded = 0
GROUP BY C.Title
ORDER BY TotalRevenue DESC;
--------------------------------------------------------------------------2
SELECT I.FullName, I.Salary, SUM(P.Amount) as TotalRevenue
FROM Instructors I
JOIN CourseSessions CS ON I.Id = CS.InstructorId
JOIN Enrollments E ON CS.Id = E.SessionId
JOIN Payments P ON E.Id = P.EnrollmentId
GROUP BY I.FullName, I.Salary;
------------------------------------------------------------------3
SELECT 
    T.FullName, 
    COUNT(E.SessionId) AS TotalSessions
FROM Trainees T
LEFT JOIN Enrollments E ON T.Id = E.TraineeId
GROUP BY T.FullName
HAVING COUNT(E.SessionId) > 2;
----------------------------------------------------------------4
SELECT CS.Id, C.Title, COUNT(E.Id) as EnrolledCount
FROM CourseSessions CS
JOIN Courses C ON CS.CourseId = C.Id
LEFT JOIN Enrollments E ON CS.Id = E.SessionId
GROUP BY CS.Id, C.Title, C.MaxCapacity
HAVING COUNT(E.Id) > (C.MaxCapacity * 0.8);
-----------------------------------------------------------5
SELECT TOP 3 T.FullName, AVG(E.Grade) as AvgGrade
FROM Trainees T JOIN Enrollments E ON T.Id = E.TraineeId
GROUP BY T.FullName ORDER BY AvgGrade DESC;
---------------------------------------------------6
SELECT 
    T.FullName AS TraineeName,
    C.Title AS CourseName,
    C.Price AS CourseTotal,
    ISNULL(SUM(P.Amount), 0) AS TotalPaid,
    (C.Price - ISNULL(SUM(P.Amount), 0)) AS RemainingBalance
FROM Trainees T
JOIN Enrollments E ON T.Id = E.TraineeId
JOIN CourseSessions CS ON E.SessionId = CS.Id
JOIN Courses C ON CS.CourseId = C.Id
LEFT JOIN Payments P ON E.Id = P.EnrollmentId AND P.IsRefunded = 0
GROUP BY T.FullName, C.Title, C.Price
HAVING ISNULL(SUM(P.Amount), 0) < C.Price;
-------------------------------views
CREATE VIEW vw_TraineeReport AS
SELECT 
    T.FullName AS TraineeName,
    COUNT(E.Id) AS TotalCourses,
    AVG(E.Grade) AS AverageGrade,
    ISNULL(SUM(P.Amount), 0) AS TotalPaid
FROM Trainees T
LEFT JOIN Enrollments E ON T.Id = E.TraineeId
LEFT JOIN Payments P ON E.Id = P.EnrollmentId AND P.IsRefunded = 0
GROUP BY T.Id, T.FullName;
SELECT * FROM vw_TraineeReport ORDER BY AverageGrade DESC
---------------------------------------------stored procedure
CREATE PROCEDURE sp_EnrollTrainee
    @TraineeId INT,
    @SessionId INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CurrentCount INT;
    DECLARE @MaxCap INT;
    SELECT 
        @CurrentCount = COUNT(E.Id), 
        @MaxCap = C.MaxCapacity
    FROM CourseSessions CS
    JOIN Courses C ON CS.CourseId = C.Id
    LEFT JOIN Enrollments E ON CS.Id = E.SessionId
    WHERE CS.Id = @SessionId
    GROUP BY C.MaxCapacity;
    IF EXISTS (SELECT 1 FROM Enrollments WHERE TraineeId = @TraineeId AND SessionId = @SessionId)
    BEGIN
        PRINT 'Error: Trainee is already enrolled in this session.';
        RETURN;
    END
    IF @CurrentCount >= @MaxCap
    BEGIN
        PRINT 'Error: Cannot enroll. Session has reached its maximum capacity of ' + CAST(@MaxCap AS VARCHAR);
        RETURN;
    END
    INSERT INTO Enrollments (TraineeId, SessionId, EnrollmentDate, _Status)
    VALUES (@TraineeId, @SessionId, GETDATE(), 'Enrolled');

    PRINT 'Success: Trainee enrolled successfully.';
END
EXEC sp_EnrollTrainee @TraineeId = 26, @SessionId = 1;
----------------------------------------------------function
CREATE FUNCTION fn_GetCourseRevenue (@CourseId INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(10,2);
    SELECT @TotalRevenue = SUM(ISNULL(P.Amount, 0))
    FROM Payments P
    JOIN Enrollments E ON P.EnrollmentId = E.Id
    JOIN CourseSessions CS ON E.SessionId = CS.Id
    WHERE CS.CourseId = @CourseId 
    AND P.IsRefunded = 0;
    RETURN ISNULL(@TotalRevenue, 0);
END;
SELECT dbo.fn_GetCourseRevenue(2) AS TotalRevenue;
-- 10 Trainees
INSERT INTO Trainees (NationalId, FullName, Email, Track, EnrollmentDate) VALUES
('NID001', 'Ahmed Ali', 'ahmed@email.com', 'DotNet', '2024-01-10'),
('NID002', 'Sara John', 'sara@email.com', 'Java', '2024-01-12'),
('NID003', 'Mona Saad', 'mona@email.com', 'Data Science', '2024-01-15'),
('NID004', 'John Doe', 'john@email.com', 'DotNet', '2024-01-20'),
('NID005', 'Jane Smith', 'jane@email.com', 'Java', '2024-02-01'),
('NID006', 'Omar Amr', 'omar@email.com', 'Data Science', '2024-02-05'),
('NID007', 'Laila Noor', 'laila@email.com', 'DotNet', '2024-02-10'),
('NID008', 'Tom Brown', 'tom@email.com', 'Java', '2024-02-15'),
('NID009', 'Zaid Ali', 'zaid@email.com', 'UI/UX', '2024-02-20'),
('NID010', 'Huda Kamel', 'huda@email.com', 'UI/UX', '2024-02-25');
INSERT INTO Trainees (NationalId, FullName, Email, Track, EnrollmentDate) VALUES
('NID011', 'Mark Taylor', 'mark@email.com', 'DotNet', '2024-03-01'),
('NID012', 'Emma Wilson', 'emma@email.com', 'Java', '2024-03-02'),
('NID013', 'Lucas Grey', 'lucas@email.com', 'Data Science', '2024-03-03'),
('NID014', 'Sophia Reed', 'sophia@email.com', 'DotNet', '2024-03-04'),
('NID015', 'Liam Neeson', 'liam@email.com', 'UI/UX', '2024-03-05'),
('NID016', 'Olivia Pope', 'olivia@email.com', 'DotNet', '2024-03-06'),
('NID017', 'Ethan Hunt', 'ethan@email.com', 'Java', '2024-03-07');
INSERT INTO Trainees (NationalId, FullName, Email, Track, EnrollmentDate) VALUES
('NID018', 'Walter White', 'heisenberg@email.com', 'Data Science', '2024-03-08'),
('NID019', 'Jesse Pinkman', 'jesse@email.com', 'UI/UX', '2024-03-09'),
('NID020', 'Skyler White', 'skyler@email.com', 'DotNet', '2024-03-10'),
('NID021', 'Hank Schrader', 'hank@email.com', 'Cyber Security', '2024-03-11'),
('NID022', 'Saul Goodman', 'saul@email.com', 'Java', '2024-03-12'),
('NID023', 'Kim Wexler', 'kim@email.com', 'Java', '2024-03-13'),
('NID024', 'Gustavo Fring', 'gus@email.com', 'Mobile Dev', '2024-03-14'),
('NID025', 'Mike Ehrmantraut', 'mike@email.com', 'Cyber Security', '2024-03-15'),
('NID026', 'Todd Alquist', 'todd@email.com', 'DotNet', '2024-03-16'),
('NID027', 'Lydia Rodarte', 'lydia@email.com', 'Data Science', '2024-03-17');
-- 10 Instructors
INSERT INTO Instructors (FullName, Email, Salary, HireDate) VALUES
('Dr. Robert Smith', 'robert@edu.com', 8000.00, '2020-05-01'),
('Eng. Maria Garcia', 'maria@edu.com', 7500.00, '2021-03-15'),
('Dr. Alan Turing', 'alan@edu.com', 9500.00, '2019-11-10'),
('Sarah Connor', 'sconnor@edu.com', 6000.00, '2022-01-10'),
('Michael Scott', 'mscott@edu.com', 5000.00, '2023-04-01'),
('Ada Lovelace', 'ada@edu.com', 9000.00, '2020-08-20'),
('Linus Torvalds', 'linus@edu.com', 8500.00, '2021-06-12'),
('Grace Hopper', 'grace@edu.com', 8800.00, '2018-09-30'),
('Steve Woz', 'woz@edu.com', 7200.00, '2022-10-05'),
('Bill Gates', 'bill@edu.com', 9900.00, '2017-01-01');

-- 10 Courses
INSERT INTO Courses (Title, _Hours, Price, MaxCapacity) VALUES
('SQL Fundamentals', 40, 300.00, 20),
('C# Programming', 60, 500.00, 15),
('Python for Data', 50, 450.00, 25),
('HTML & CSS', 30, 200.00, 30),
('Java Advanced', 70, 600.00, 12),
('Machine Learning', 80, 800.00, 10),
('Cloud Computing', 45, 550.00, 20),
('Cyber Security', 55, 700.00, 15),
('React JS', 40, 350.00, 25),
('Mobile Dev', 65, 500.00, 15);
-- 10 Course Sessions (Linking Courses and Instructors)
INSERT INTO CourseSessions (CourseId, InstructorId, StartDate, EndDate, RoomNumber) VALUES
(1, 1, '2024-03-01', '2024-04-01', 'Room 101'),
(2, 2, '2024-03-10', '2024-05-10', 'Lab A'),
(3, 3, '2024-03-15', '2024-04-15', 'Room 202'),
(4, 4, '2024-04-01', '2024-05-01', 'Online'),
(5, 5, '2024-04-05', '2024-06-05', 'Lab B'),
(6, 6, '2024-05-01', '2024-07-01', 'Room 303'),
(7, 7, '2024-05-10', '2024-06-10', 'Online'),
(8, 8, '2024-06-01', '2024-07-15', 'Lab C'),
(9, 9, '2024-06-15', '2024-07-25', 'Room 102'),
(10, 10, '2024-07-01', '2024-08-30', 'Room 404');

-- 10 Enrollments (Linking Trainees and Sessions)
INSERT INTO Enrollments (TraineeId, SessionId, Grade, _Status) VALUES
(1, 1, 85, 'Completed'),
(2, 2, 90, 'Enrolled'),
(3, 3, NULL, 'Enrolled'),
(4, 1, 75, 'Completed'),
(5, 5, 88, 'Completed'),
(6, 6, NULL, 'Enrolled'),
(7, 7, 92, 'Completed'),
(8, 8, NULL, 'Enrolled'),
(9, 9, NULL, 'Enrolled'),
(10, 10, 95, 'Completed');
INSERT INTO Enrollments (TraineeId, SessionId, Grade, _Status) VALUES
(2, 4, 97, 'Enrolled'),
(2, 8, 95, 'Enrolled'),
(2, 6, 99, 'Enrolled');
INSERT INTO Enrollments (TraineeId, SessionId, Grade, _Status) VALUES
(11, 4, 97, 'Enrolled'),
(12, 1, 81, 'Completed'),
(13, 1, 82, 'Completed'),
(14, 1, 83, 'Completed'),
(15, 1, 84, 'Completed'),
(16, 1, 86, 'Completed'),
(17, 1, 87, 'Completed');
INSERT INTO Enrollments (TraineeId, SessionId, Grade, _Status) VALUES
(18, 4, 97, 'Enrolled'),
(19, 1, 81, 'Completed'),
(20, 1, 82, 'Completed'),
(21, 1, 83, 'Completed'),
(22, 1, 84, 'Completed'),
(23, 1, 86, 'Completed'),
(24, 1, 87, 'Completed');
INSERT INTO Enrollments (TraineeId, SessionId, Grade, _Status) VALUES
(25, 1, 97, 'Enrolled'),
(26, 1, 95, 'Enrolled'),
(27, 1, 99, 'Enrolled');
-- 10 Payments (Linking to Enrollments)
INSERT INTO Payments (EnrollmentId, Amount, PaymentMethod) VALUES
(1, 300.00, 'Cash'),
(2, 500.00, 'Card'),
(3, 450.00, 'Installment'),
(4, 300.00, 'Card'),
(5, 600.00, 'Cash'),
(6, 800.00, 'Card'),
(7, 550.00, 'Installment'),
(8, 700.00, 'Card'),
(9, 350.00, 'Cash'),
(10, 500.00, 'Card');
INSERT INTO Payments (EnrollmentId, Amount, PaymentDate, PaymentMethod, IsRefunded) VALUES
-- Full Payments (Will be hidden from the debt report)
(11, 200.00, '2026-03-01 10:00:00', 'Card', 0),    -- Mark Taylor
(14, 300.00, '2026-03-01 11:30:00', 'Cash', 0),    -- Sophia Reed
(19, 200.00, '2026-03-02 09:15:00', 'Card', 0),    -- Jesse Pinkman

-- Partial Payments (Will show remaining balance)
(12, 100.00, '2026-03-02 14:00:00', 'Cash', 0),    -- Emma Wilson (Owes 200)
(13, 150.00, '2026-03-03 15:00:00', 'Card', 0),    -- Lucas Grey (Owes 150)
(16, 50.00,  '2026-03-03 12:00:00', 'Installment', 0), -- Olivia Pope (Owes 250)

-- Multi-row Installments (Tests SUM logic for Liam Neeson)
(15, 100.00, '2026-03-04 10:00:00', 'Installment', 0), 
(15, 75.00,  '2026-03-05 11:00:00', 'Installment', 0), -- Total 175/300

-- Refunded Payment (Query will ignore this, showing full debt)
(17, 300.00, '2026-03-05 16:00:00', 'Card', 1);    -- Ethan Hunt
INSERT INTO Payments (EnrollmentId, Amount, PaymentDate, PaymentMethod, IsRefunded) VALUES
-- Walter White - HTML & CSS (200.00)
(18, 200.00, '2026-03-05 09:00:00', 'Cash', 0),

-- Ethan Hunt - SQL Fundamentals (300.00) 
-- (Note: His previous 300 was refunded, so we add a new valid one)
(17, 300.00, '2026-03-05 09:15:00', 'Card', 0),

-- The rest of the SQL Fundamentals crew (300.00 each)
(24, 300.00, '2026-03-05 10:00:00', 'Cash', 0), -- Gustavo Fring
(21, 300.00, '2026-03-05 10:10:00', 'Card', 0), -- Hank Schrader
(19, 300.00, '2026-03-05 10:20:00', 'Cash', 0), -- Jesse Pinkman
(23, 300.00, '2026-03-05 10:30:00', 'Card', 0), -- Kim Wexler
(15, 300.00, '2026-03-05 10:40:00', 'Cash', 0), -- Liam Neeson
(27, 300.00, '2026-03-05 10:50:00', 'Card', 0), -- Lydia Rodarte
(25, 300.00, '2026-03-05 11:00:00', 'Cash', 0), -- Mike Ehrmantraut
(22, 300.00, '2026-03-05 11:10:00', 'Card', 0), -- Saul Goodman
(20, 300.00, '2026-03-05 11:20:00', 'Cash', 0), -- Skyler White
(14, 300.00, '2026-03-05 11:30:00', 'Card', 0), -- Sophia Reed
(26, 300.00, '2026-03-05 11:40:00', 'Cash', 0); -- Todd Alquist
INSERT INTO Library (Name, Location, Contact_Number, Established_Year) VALUES 
('Central Library', 'City Center', '123456789', 1995),
('North Branch', 'North Ave', '987654321', 2005),
('East Reading Hall', 'East Blvd', '112233445', 2010);


INSERT INTO Book (ISBN, Title, Genre, Price, Shelf_Location, Library_ID) VALUES 
('9780001', 'Intro to AI', 'Non-fiction', 25.00, 'A1', 1),
('9780002', 'Python Basics', 'Non-fiction', 30.00, 'A2', 1),
('9780003', 'C# Guide', 'Reference', 28.50, 'A3', 1),
('9780004', 'Data Science', 'Non-fiction', 35.00, 'B1', 2),
('9780005', 'Algorithms', 'Reference', 40.00, 'B2', 2),
('9780006', 'Children''s World', 'Children', 15.00, 'C1', 2),
('9780007', 'Harry Potter', 'Fiction', 20.00, 'C2', 2),
('9780008', 'Narnia', 'Fiction', 22.00, 'D1', 3),
('9780009', 'Chemistry 101', 'Reference', 26.00, 'D2', 3),
('9780010', 'Story Time', 'Children', 18.00, 'E1', 3);


INSERT INTO Member (Name, Email, Phone, Membership_Start_Date) VALUES 
('Ahmed', 'ahmed@example.com', '111111111', '2022-01-01'),
('Sara', 'sara@example.com', '222222222', '2022-02-01'),
('Khalid', 'khalid@example.com', '333333333', '2022-03-01'),
('Fatma', 'fatma@example.com', '444444444', '2022-04-01'),
('Yousef', 'yousef@example.com', '555555555', '2022-05-01'),
('Noor', 'noor@example.com', '666666666', '2022-06-01');


INSERT INTO Staff (Full_Name, Position, Contract, Library_ID) VALUES 
('Ali Hassan', 'Manager', 'Full-time', 1),
('Laila Said', 'Assistant', 'Part-time', 1),
('Salem Nasser', 'IT', 'Full-time', 2),
('Mona Talib', 'Receptionist', 'Part-time', 3);


INSERT INTO Payment_Method (Method_Name) VALUES ('cash'), ('credit');


INSERT INTO Payment (Date, Amount, Method_ID) VALUES 
('2024-01-01', 25.00, 1),
('2024-01-10', 30.00, 2),
('2024-02-15', 20.00, 1),
('2024-03-01', 40.00, 2);


INSERT INTO Loan (Book_ID, Member_ID, Payment_ID, Loan_Date, Due_Date, Return_Date, Status) VALUES 
(1, 1, 1, '2024-01-01', '2024-01-15', '2024-01-10', 'Returned'),
(2, 2, 2, '2024-01-04', '2024-01-18', '2024-01-18', 'Returned'),
(3, 3, 1, '2024-01-07', '2024-01-21', '2024-01-27', 'Overdue'),
(4, 4, 3, '2024-01-10', '2024-01-24', NULL, 'Issued'),
(5, 5, 4, '2024-01-13', '2024-01-27', NULL, 'Issued'),
(6, 6, 2, '2024-01-16', '2024-01-30', NULL, 'Issued'),
(7, 1, 1, '2024-01-19', '2024-02-02', '2024-01-29', 'Returned'),
(8, 2, 3, '2024-01-22', '2024-02-05', '2024-02-10', 'Overdue');


INSERT INTO Review (Member_ID, Book_ID, Review_Date, Comments, Rating) VALUES 
(1, 1, '2024-01-15', 'Excellent', 5),
(2, 2, '2024-01-18', 'Very good', 4),
(3, 3, '2024-01-20', 'Good', 3),
(4, 4, '2024-01-22', 'Nice', 4),
(5, 5, '2024-01-25', 'Interesting', 5),
(6, 6, '2024-01-28', 'Loved it', 5);

INSERT INTO Transaction_Efficiency (Loan_ID, Week, Success_Rate, Processing_Time) VALUES 
(1, 1, 95.5, 2),
(1, 2, 96.0, 1),
(2, 1, 90.0, 3),
(2, 2, 91.5, 2),
(3, 1, 88.0, 4),
(3, 2, 87.0, 5),
(4, 1, 85.0, 2),
(4, 2, 84.5, 2),
(5, 1, 93.0, 1),
(5, 2, 94.0, 1);


SELECT Loan.Loan_ID, Member.Name AS MemberName, Book.Title AS BookTitle, Loan.Due_Date
FROM Loan
JOIN Member ON Loan.Member_ID = Member.Member_ID
JOIN Book ON Loan.Book_ID = Book.Book_ID
WHERE Loan.Status = 'Overdue';


SELECT *
FROM Book
WHERE Availability_Status = 0;


SELECT Member.Member_ID, Member.Name, COUNT(Loan.Loan_ID) AS TotalLoans
FROM Loan
JOIN Member ON Loan.Member_ID = Member.Member_ID
GROUP BY Member.Member_ID, Member.Name
HAVING COUNT(Loan.Loan_ID) > 2;

SELECT Book.Book_ID, Book.Title, AVG(Review.Rating) AS AverageRating
FROM Review
JOIN Book ON Review.Book_ID = Book.Book_ID
GROUP BY Book.Book_ID, Book.Title;


SELECT Library.Library_ID, Genre, COUNT(Book.Book_ID) AS GenreCount
FROM Book
JOIN Library ON Book.Library_ID = Library.Library_ID
GROUP BY Library.Library_ID, Genre;


SELECT Member.Member_ID, Member.Name
FROM Member
LEFT JOIN Loan ON Member.Member_ID = Loan.Member_ID
WHERE Loan.Loan_ID IS NULL;


SELECT Member.Member_ID, Member.Name, SUM(Payment.Amount) AS TotalPaid
FROM Payment
JOIN Loan ON Payment.Payment_ID = Loan.Payment_ID
JOIN Member ON Loan.Member_ID = Member.Member_ID
GROUP BY Member.Member_ID, Member.Name;

SELECT Review.Review_ID, Member.Name AS MemberName, Book.Title AS BookTitle, Review.Comments, Review.Rating
FROM Review
JOIN Member ON Review.Member_ID = Member.Member_ID
JOIN Book ON Review.Book_ID = Book.Book_ID;

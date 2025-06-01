DELETE FROM Member WHERE Member_ID = 1;

DELETE FROM Member WHERE Member_ID = 2;


DELETE FROM Book WHERE Book_ID = 1;

INSERT INTO Loan (Book_ID, Member_ID, Payment_ID, Loan_Date, Due_Date, Status)
VALUES (1, 99, 1, GETDATE(), DATEADD(DAY, 14, GETDATE()), 'Issued');

INSERT INTO Payment (Date, Amount, Method_ID)
VALUES ('2024-01-15', -10, 1);

UPDATE Book SET Genre = 'Sci-Fi' WHERE Book_ID = 1;

INSERT INTO Review (Member_ID, Book_ID, Review_Date, Comments, Rating)
VALUES (1, 999, GETDATE(), 'Great!', 5);

UPDATE Loan SET Member_ID = 999 WHERE Loan_ID = 1;
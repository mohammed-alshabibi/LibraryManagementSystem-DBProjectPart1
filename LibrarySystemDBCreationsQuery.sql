-- STEP 1: Create the database
CREATE DATABASE LibrarySystemDB;


-- STEP 2: Use the database
USE LibrarySystemDB;


-- STEP 3: Create all tables in default schema (dbo)

CREATE TABLE Library (
    Library_ID INT IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(150),
    Contact_Number VARCHAR(20),
    Established_Year INT CHECK (Established_Year >= 1900),
    CONSTRAINT PK_Library_ID PRIMARY KEY (Library_ID)
);

CREATE TABLE Member (
    Member_ID INT IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Membership_Start_Date DATE NOT NULL,
    CONSTRAINT PK_Member_ID PRIMARY KEY (Member_ID)
);

CREATE TABLE Book (
    Book_ID INT IDENTITY,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    Title NVARCHAR(100) NOT NULL,
    Genre VARCHAR(50) CHECK (Genre IN ('Fiction', 'Non-fiction', 'Reference', 'Children')),
    Price DECIMAL(6,2) CHECK (Price > 0),
    Shelf_Location NVARCHAR(50),
    Availability_Status BIT DEFAULT 1,
    Library_ID INT,
    CONSTRAINT PK_Book_ID PRIMARY KEY (Book_ID),
    CONSTRAINT FK_Book_Library_ID FOREIGN KEY (Library_ID)
        REFERENCES Library(Library_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Staff (
    Staff_ID INT IDENTITY,
    Full_Name NVARCHAR(100),
    Position NVARCHAR(50),
    Contract NVARCHAR(50),
    Library_ID INT,
    CONSTRAINT PK_Staff_ID PRIMARY KEY (Staff_ID),
    CONSTRAINT FK_Staff_Library_ID FOREIGN KEY (Library_ID)
        REFERENCES Library(Library_ID)
);

CREATE TABLE Payment_Method (
    Method_ID INT IDENTITY,
    Method_Name VARCHAR(20) CHECK (Method_Name IN ('cash', 'credit')),
    CONSTRAINT PK_Method_ID PRIMARY KEY (Method_ID)
);

CREATE TABLE Payment (
    Payment_ID INT IDENTITY,
    Date DATE NOT NULL,
    Amount DECIMAL(6,2) CHECK (Amount > 0),
    Method_ID INT,
    CONSTRAINT PK_Payment_ID PRIMARY KEY (Payment_ID),
    CONSTRAINT FK_Payment_Method_ID FOREIGN KEY (Method_ID)
        REFERENCES Payment_Method(Method_ID)
);

CREATE TABLE Loan (
    Loan_ID INT IDENTITY,
    Book_ID INT,
    Member_ID INT,
    Payment_ID INT,
    Loan_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Return_Date DATE,
    Status VARCHAR(20) CHECK (Status IN ('Issued', 'Returned', 'Overdue')) DEFAULT 'Issued',
    CONSTRAINT PK_Loan_ID PRIMARY KEY (Loan_ID),
    CONSTRAINT FK_Loan_Book_ID FOREIGN KEY (Book_ID)
        REFERENCES Book(Book_ID),
    CONSTRAINT FK_Loan_Member_ID FOREIGN KEY (Member_ID)
        REFERENCES Member(Member_ID),
    CONSTRAINT FK_Loan_Payment_ID FOREIGN KEY (Payment_ID)
        REFERENCES Payment(Payment_ID)
);

CREATE TABLE Review (
    Review_ID INT IDENTITY,
    Member_ID INT,
    Book_ID INT,
    Review_Date DATE NOT NULL,
    Comments NVARCHAR(255) DEFAULT 'No comments',
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    CONSTRAINT PK_Review_ID PRIMARY KEY (Review_ID),
    CONSTRAINT FK_Review_Member_ID FOREIGN KEY (Member_ID)
        REFERENCES Member(Member_ID),
    CONSTRAINT FK_Review_Book_ID FOREIGN KEY (Book_ID)
        REFERENCES Book(Book_ID)
);

CREATE TABLE Transaction_Efficiency (
    Loan_ID INT,
    Week INT,
    Success_Rate FLOAT,
    Processing_Time INT,
    CONSTRAINT PK_Transaction_Efficiency PRIMARY KEY (Loan_ID, Week),
    CONSTRAINT FK_TE_Loan_ID FOREIGN KEY (Loan_ID)
        REFERENCES Loan(Loan_ID)
);

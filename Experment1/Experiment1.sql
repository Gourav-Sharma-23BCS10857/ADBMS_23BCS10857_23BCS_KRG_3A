--Easy-Level Problem
CREATE TABLE TBL_AUTHOR (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE TBL_BOOK (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES TBL_AUTHOR(AuthorID)
);

INSERT INTO TBL_AUTHOR (AuthorID, AuthorName, Country) VALUES
(1, 'Gourav', 'India'),
(2, 'Bunty', 'Nepal'),
(3, 'Himanshu', 'Bhutan'),
(4, 'Bharat', 'India'),
(5, 'Mehak', 'Nigeria');

INSERT INTO TBL_BOOK (BookID, Title, AuthorID) VALUES
(101, 'Mastering DBMS', 1),
(102, 'DAA for Beginners', 2),
(103, 'Competitive Coding Secrets', 3),
(104, 'Algorithm Design Made Easy', 4),
(105, 'Problem Solving in C++', 5);

SELECT B.Title, A.AuthorName, A.Country
FROM TBL_BOOK B
INNER JOIN TBL_AUTHOR A ON B.AuthorID = A.AuthorID;


--Medium-Level Problem

CREATE TABLE TBL_DEPARTMENT (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE TBL_COURSE (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES TBL_DEPARTMENT(DeptID)
);

INSERT INTO TBL_DEPARTMENT (DeptID, DeptName) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics'),
(4, 'Mechanical'),
(5, 'Civil');

INSERT INTO TBL_COURSE (CourseID, CourseName, DeptID) VALUES
(101, 'DBMS', 1),
(102, 'DAA', 1),
(103, 'Competitive Coding', 1),
(104, 'Web Development', 2),
(105, 'Cyber Security', 2),
(106, 'Data Structures', 2),
(107, 'Digital Circuits', 3),
(108, 'Microprocessors', 3),
(109, 'Thermodynamics', 4),
(110, 'Structural Analysis', 5);

SELECT DeptName
FROM TBL_DEPARTMENT
WHERE DeptID IN (
    SELECT DeptID
    FROM TBL_COURSE
    GROUP BY DeptID
    HAVING COUNT(CourseID) > 2
);



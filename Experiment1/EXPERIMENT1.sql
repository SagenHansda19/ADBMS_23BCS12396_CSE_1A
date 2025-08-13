--[EASY QUESTION]
CREATE TABLE TBL_AUTHOR (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(30)
);

CREATE TABLE TBL_BOOK (
    BOOK_ID INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(50),
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
);

INSERT INTO TBL_AUTHOR (AUTHOR_ID, AUTHOR_NAME) VALUES
(1, 'Robert C. Martin'),
(2, 'Bjarne Stroustrup'),
(3, 'Donald Knuth');

INSERT INTO TBL_BOOK (BOOK_ID, BOOK_TITLE, AUTHOR_ID) VALUES
(101, 'Clean Code', 1),
(102, 'The C++ Programming Language', 2),
(103, 'The Art of Computer Programming', 3),
(104, 'Clean Architecture', 1),
(105, 'Programming Principles and Practice', 2);

SELECT book.BOOK_TITLE AS Title, author.AUTHOR_NAME AS Author
FROM TBL_BOOK AS book
INNER JOIN TBL_AUTHOR AS author ON book.AUTHOR_ID = author.AUTHOR_ID
ORDER BY Author, Title;


--[MEDIUM QUESTION]
CREATE TABLE University_Branches (
    branch_code INT PRIMARY KEY,
    branch_title VARCHAR(100) NOT NULL
);

CREATE TABLE Class_Listings (
    class_id INT PRIMARY KEY,
    class_subject VARCHAR(100) NOT NULL,
    branch_code INT,
    FOREIGN KEY (branch_code) REFERENCES University_Branches(branch_code)
);

INSERT INTO University_Branches (branch_code, branch_title) VALUES
(1, 'Information Technology'),
(2, 'Aerospace Engineering'),
(3, 'Chemical Engineering'),
(4, 'Architecture'),
(5, 'Statistics');

INSERT INTO Class_Listings (class_id, class_subject, branch_code) VALUES
(101, 'Web Development', 1),
(102, 'Database Management', 1),
(103, 'Cybersecurity Fundamentals', 1),
(104, 'Aerodynamics', 2),
(105, 'Spacecraft Design', 2),
(106, 'Organic Chemistry', 3),
(107, 'Process Control', 3),
(108, 'Urban Planning', 4),
(109, 'Statistical Inference', 5),
(110, 'Regression Analysis', 5),
(111, 'Time Series Analysis', 5);



SELECT branch.branch_title, COUNT(listing.class_id) AS number_of_classes
FROM University_Branches AS branch
LEFT JOIN
Class_Listings AS listing 
ON branch.branch_code = listing.branch_code
GROUP BY branch.branch_title
ORDER BY branch.branch_title;

SELECT branch.branch_title, COUNT(listing.class_id) AS class_count
FROM University_Branches AS branch
JOIN Class_Listings AS listing ON branch.branch_code = listing.branch_code
GROUP BY branch.branch_title
HAVING COUNT(listing.class_id) > 2
ORDER BY branch.branch_title;

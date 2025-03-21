USE Saskpoly
 
/** INNER JOIN Queries **/

/** List all students (StudentID, FirstName, LastName) who are enrolled in a course along with the course title (CourseCode, Title). **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode, c.Title
FROM Student s
INNER JOIN Student_Course e ON s.ID = e.StudentID
INNER JOIN Course c ON e.CourseCode = c.CourseCode;


/** Find students (StudentID, FirstName, LastName) enrolled in a course (CourseCode, Title) with a fee greater than $500 (Fee). **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode, c.Title
FROM Student s
INNER JOIN Student_Course e ON s.ID = e.StudentID
INNER JOIN Course c ON e.CourseCode = c.CourseCode
WHERE c.Fee > 500;

/** List all courses (CourseCode, Title) with students (StudentID, FirstName, LastName) and sort them by course title (Title). **/

SELECT c.CourseCode, c.Title, s.ID, s.FirstName, s.LastName
FROM Course c
INNER JOIN Student_Course e ON c.CourseCode = e.CourseCode
INNER JOIN Student s ON e.StudentID = s.ID
ORDER BY c.Title;

/*****************************************************************/

/** LEFT JOIN Queries **/

/** List all students (StudentID, FirstName, LastName) and their enrolled courses (CourseCode), including students who are not enrolled in any course. **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode
FROM Student s
LEFT JOIN Student_Course e ON s.ID = e.StudentID
LEFT JOIN Course c ON e.CourseCode = c.CourseCode;


/** Find all students (StudentID, FirstName, LastName) and their enrolled courses (CourseCode) where the fee is less than $300 (Fee). **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode
FROM Student s
LEFT JOIN Student_Course e ON s.ID = e.StudentID
LEFT JOIN Course c ON e.CourseCode = c.CourseCode
WHERE c.Fee < 300;


/** List all students (StudentID, FirstName, LastName) with courses (CourseCode), including students without courses, ordered by StudentID. **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode
FROM Student s
LEFT JOIN Student_Course e ON s.ID = e.StudentID
LEFT JOIN Course c ON e.CourseCode = c.CourseCode
ORDER BY s.ID;


/***************************************/


/** RIGHT JOIN Queries **/


/** List all courses (CourseCode, Title) and enrolled students (StudentID), including courses with no students. **/

SELECT c.CourseCode, c.Title, s.ID
FROM Course c
RIGHT JOIN Student_Course e ON c.CourseCode = e.CourseCode
RIGHT JOIN Student s ON e.StudentID = s.ID;

/** Find all courses (CourseCode, Title) with students (StudentID) where the fee is more than $1000 (Fee). **/

SELECT c.CourseCode, c.Title, s.ID
FROM Course c
RIGHT JOIN Student_Course e ON c.CourseCode = e.CourseCode
RIGHT JOIN Student s ON e.StudentID = s.ID
WHERE c.Fee > 1000;


/** Show all courses (CourseCode, Title), including those without students, sorted by course title (Title). **/

SELECT c.CourseCode, c.Title
FROM Course c
RIGHT JOIN Student_Course e ON c.CourseCode = e.CourseCode
RIGHT JOIN Student s ON e.StudentID = s.ID
ORDER BY c.Title;


/** FULL OUTER JOIN Queries **/


/** List all students (StudentID, FirstName, LastName) and courses (CourseCode, Title), even if there is no match between them. **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode, c.Title
FROM Student s
FULL OUTER JOIN Student_Course e ON s.ID = e.StudentID
FULL OUTER JOIN Course c ON e.CourseCode = c.CourseCode;


/** Find all students (StudentID, FirstName, LastName) and courses (CourseCode, Title), including unmatched ones, where course fees are not null (Fee). **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode, c.Title
FROM Student s
FULL OUTER JOIN Student_Course e ON s.ID = e.StudentID
FULL OUTER JOIN Course c ON e.CourseCode = c.CourseCode
WHERE c.Fee IS NOT NULL;


/** Show all students (StudentID, FirstName, LastName) and courses (CourseCode, Title), sorting results by StudentID. **/

SELECT s.ID, s.FirstName, s.LastName, c.CourseCode, c.Title
FROM Student s
FULL OUTER JOIN Student_Course e ON s.ID = e.StudentID
FULL OUTER JOIN Course c ON e.CourseCode = c.CourseCode
ORDER BY s.ID;
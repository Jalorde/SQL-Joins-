USE Saskpoly

Select FirstName,LastName,Course.CourseCode,Title,Fee
from student, student_course, Course
where student.ID=Student_Course.StudentID
	and Student_Course.CourseCode=Course.CourseCode
	and Student.ID=2


-- Inner Join Examples
select FirstName,LastName,sc.CourseCode,Title,Fee
from Student s
	inner join Student_Course sc on s.ID=sc.StudentID
	inner join Course c on c.CourseCode=sc.CourseCode
	where s.id=2



select c.CourseCode,c.Title,c.Fee,i.FirstName +' '+ i.LastName as [Instructor Name]	
from Course c
	inner join Instructors i on c.Instructor = i.ID


-- Outer join Examples
insert into Student values ((SELECT MAX(ID)+1 FROM Student),'Smith','John','123 Main St.')
insert into Course values ('COMP255','Introduction to C# =',675,1)

select * from Student s
	full outer join Student_Course sc on s.ID=sc.StudentID
	where sc.StudentID IS NULL

--List ID, FirstName, LastName in a course with CourseCode=COMP 234
--List ID, full name [with custom column title] in a course with CourseCode=COMP234
--List ID, full name [with custom column title] in a course with CourseCode=COMP234 sorted by last name


SELECT s.ID, s.FirstName, s.LastName
FROM Student s
	inner join Student_Course sc on s.ID = sc.StudentId
	WHERE sc.CourseCode = 'COMP 234'

SELECT ID, FirstName + ' ' + LastName 

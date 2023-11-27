-- 2. Modified (Create an SQL query to list the students names that are taught by instructors whose names contain the word "Smith.")
-- Foreign Key Required (in this it's not used)
--Select *
--From Students
--Join (
--	Select *
--	From Courses
--	Where Instructor Like '%Smith%'
--) as QCourses
--On Students.CourseID = QCourses.CourseID



-- 1] Write an SQL query to retrieve the first and last names of students who have the same first and last name as other students.
;With FullNameCTE As
(
	Select concat(FirstName, LastName) as FullName
	From Students

),
DuplicateFullNameCTE As
(
	Select   FullName,
			 Count(*) as [Count]
	From     FullNameCTE
	Group By FullName
)
Select *
From   DuplicateFullNameCTE
Where [Count] > 1;


-- 2] Create an SQL query to list the course names that are taught by instructors whose names contain the word "Smith."
Select *
From   Courses
Where  Instructor Like '%Smith%'

 
-- 3] Write an SQL query to count the number of courses that have the same name as other courses.
;With DuplicateCoursesCTE As
(
	Select   CourseName,
		     Count(*) as DuplicateCount
	From	 Courses
	Group By CourseName
)
Select (Select Count(*)
	   From DuplicateCoursesCTE
	   Where  DuplicateCount > 1) as DuplicateCount2

-- giving error
--Select *,
--	   Count(*) as DuplicateCount
--From   DuplicateCoursesCTE
--Where  DuplicateCount > 1

 
-- 4] Write an SQL query to find the students who are enrolled in the same courses as a specific student (e.g., John Doe).

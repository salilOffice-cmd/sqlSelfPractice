
-- NOTE: SIR, DONT CHECK THIS. THIS IS FOR MY PRACTICE
-- 1. Modified  (Show CourseName as well)
--;With MathsStudentsCTE As
--(
--	Select *
--	From Courses
--	Where CourseName = 'Mathematics'
--)
--Select *,
--	   (Select Max(CourseName)
--	    From   MathsStudentsCTE) as CourseName
--From   Students
--Where  CourseID In (Select CourseID from MathsStudentsCTE)


-- NOTE: SIR, DONT CHECK THIS. THIS IS FOR MY PRACTICE
-- 2. Modified (delete duplicate)
--;With DuplicateStudentCTE As
--(
--	Select StudentID,
--		   ROW_NUMBER() Over (Partition By StudentName Order By StudentName) as RowNumber
--	From   Students
--)
--Delete From Students
--Where       StudentID In (Select StudentID
--						  From DuplicateStudentCTE
--					      Where RowNumber > 1)







-- 1] Write a SQL query using a Common Table Expression to list all students who are enrolled in the 'Mathematics' course.
;With MathsStudentsCTE As
(
	Select *
	From   Courses
	Where  CourseName = 'Mathematics'
)
Select *
From   Students
Where  CourseID In (Select CourseID from MathsStudentsCTE)



-- 2] Create a CTE that counts the number of duplicate student records in the 'Students' table.
;With DuplicateStudentCTE As
(
	Select StudentName,
		   Count(*) as DuplicateCount
	From   Students
	Group By StudentName
)
Select *
From DuplicateStudentCTE
Where DuplicateCount > 1


 
-- 3] Write a CTE query to find the average number of courses each student is enrolled in.
;With AvgCoursesEnrolled As
(
	Select   CourseID,
			 Count(*) as StudentCount
	From     Students
	Group By CourseID
)
Select AVG(StudentCount) as Average
From AvgCoursesEnrolled



-- 4] Create a CTE that joins the 'Students' and 'Courses' tables to list the names of students along with the courses they are enrolled in.
;With StudentCourseJoinCTE As
(
	Select Students.StudentID,
		   Students.StudentName,
		   Courses.CourseName
	From   Students
	Join   Courses
	On     Students.CourseID = Courses.CourseID
)
Select *
From StudentCourseJoinCTE








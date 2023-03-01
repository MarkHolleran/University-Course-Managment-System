Username and Passwords (ID, Pass):
Admin: (999,asdf)
Professor: (333,333)
Student: (1,1234)

sql if needed : "root" "password"



Used tomcat 9
local host port used is 8081 and admin port 9999

to start go to helloworldlogin.jsp and click green button 

Assumptions:
1. Add period ends before the start of each semester to prevent students from enrolling in a course and its prereqs in the same semester
2. Possible grades are A, B, C, D, F. Original grades of courses that have been retain will have an R prefix.
3. Only Spring and Fall semesters are offered.
4. ODBMS will automatically find the highest semester/year and set the availability of courses. 

Procedures:
1. assign_grade(cid, section, semester, yr, sid, grade) - assigns grade to the student enrolled in the section.
2. available_courses(sid) - gets a list of courses a student is allowed to take, based on the prereqs.
3. get_offered() - gets a list of courses that is being offered for the current semester.
4. get_prereqs() - gets a list of courses and their prereqs.
5. get_semester() - gets the current semester and year.
6. get_user(id, password) - returns the type of user, given the id and password (Admin, Professor, or Student)
7. section_enrollment(semester, yr, cid, section) - gets a list of students enrolled in the section for the semester.
8. student_enrolledin(sid) - gets a list of courses a student is enrolled in for the current semester.
9. student_transcript(sid) - gets a list of courses a student has already taken.

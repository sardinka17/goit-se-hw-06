-- 9. Знайти список курсів, які відвідує студент.
SELECT students.id as student_id,
    students.name as student_name,
    subjects.id as subject_id,
    subjects.name as subject_name
FROM students
JOIN marks ON marks.student_id = students.id
JOIN subjects ON subjects.id = marks.subject_id
GROUP BY students.id, students.name, subjects.id, subjects.name

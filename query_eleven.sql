-- 11. Середній бал, який певний викладач ставить певному студентові.
SELECT students.id as student_id,
    students.name as student_name,
    teachers.id as teacher_id,
    teachers.name as teacher_name,
    ROUND (AVG(marks.mark)) as average_mark
FROM students
JOIN marks ON students.id = marks.student_id
JOIN subjects ON subjects.id = marks.subject_id
JOIN teachers ON teachers.id = subjects.teacher_id
WHERE teachers.id = 1 AND students.id = 17
GROUP BY students.id, students.name, teachers.id, teachers.name

-- 8. Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT teachers.id as teacher_id,
    teachers.name as teacher_name,
    subjects.id as subject_id,
    subjects.name as subject_name,
    ROUND(AVG(marks.mark)) as average_mark
FROM teachers
JOIN subjects ON teachers.id = subjects.teacher_id
JOIN marks ON subjects.id = marks.subject_id
WHERE teachers.id = 3
GROUP BY teachers.id, teachers.name, subjects.id, subjects.name
ORDER BY average_mark

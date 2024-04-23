-- 5. Знайти які курси читає певний викладач.
SELECT teachers.id as teacher_id,
    teachers.name as teacher_name,
    subjects.name as subject_name
FROM teachers
JOIN subjects ON teachers.id = subjects.teacher_id
WHERE teachers.id = 1
GROUP BY teachers.id, teachers.name, subjects.name

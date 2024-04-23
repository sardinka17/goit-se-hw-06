-- 10. Список курсів, які певному студенту читає певний викладач.
SELECT students.id as student_id,
    students.name as student_name,
    teachers.id as teacher_id,
    teachers.name as teacher_name,
    subjects.id as subject_id,
    subjects.name as subject_name
FROM students, teachers
JOIN subjects ON subjects.teacher_id = teachers.id
WHERE students.id = 7 AND teachers.id = 1
GROUP BY students.id, students.name, teachers.id, teachers.name, subjects.id, subjects.name

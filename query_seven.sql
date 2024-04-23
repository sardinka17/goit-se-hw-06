-- 7. Знайти оцінки студентів у окремій групі з певного предмета.
SELECT students.id as student_id,
    students.name as student_name,
    groups.id as group_id,
    groups.name as group_name,
    subjects.id as subject_id,
    subjects.name as subject_name,
    marks.mark
FROM students
JOIN groups ON groups.id = students.group_id
JOIN marks ON students.id = marks.student_id
JOIN subjects ON subjects.id = marks.subject_id
WHERE groups.id = 1 AND subjects.id = 3
ORDER BY students.id, subjects.id

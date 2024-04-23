-- 6. Знайти список студентів у певній групі.
SELECT students.id as student_id,
    students.name as student_name,
    groups.id as group_id,
    groups.name as group_name
FROM students
JOIN groups ON groups.id = students.group_id
WHERE groups.id = 3
ORDER BY students.id, students.name, groups.id, groups.name

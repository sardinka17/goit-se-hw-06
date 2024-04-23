-- 12. Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT students.id as student_id,
    students.name as student_name,
    groups.id as group_id,
    groups.name as group_name,
    subjects.id as subject_id,
    subjects.name as subject_name,
    marks.mark,
    marks.created
FROM students
JOIN marks ON marks.student_id = students.id
JOIN groups ON groups.id = students.group_id
JOIN subjects ON subjects.id = marks.subject_id
WHERE groups.id = 3
    AND subjects.id = 3
    AND marks.created = (
    SELECT MAX(created)
    FROM marks
    WHERE marks.subject_id = subjects.id
    AND marks.student_id = students.id)

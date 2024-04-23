-- 3. Знайти середній бал у групах з певного предмета.
SELECT groups.name as group_name,
    subjects.name as subject_name,
    ROUND(AVG(marks.mark)) as average_mark
FROM subjects
JOIN marks ON subjects.id = marks.subject_id
JOIN students ON marks.student_id = students.id
JOIN groups ON students.group_id = groups.id
WHERE subjects.id = 2
GROUP BY groups.name, subjects.name
ORDER BY average_mark DESC

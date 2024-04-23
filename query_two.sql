-- 2. Знайти студента із найвищим середнім балом з певного предмета.
SELECT students.id,
    students.name,
    subjects.name,
    ROUND(AVG(marks.mark)) as average_mark
FROM students
JOIN marks ON students.id = marks.student_id
JOIN subjects ON subjects.id = marks.subject_id
GROUP BY students.id, students.name, subjects.name
ORDER BY average_mark DESC
LIMIT 1;

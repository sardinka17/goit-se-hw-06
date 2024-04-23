-- 1. Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT students.id,
	students.name,
	ROUND (AVG(marks.mark)) as average_mark
FROM students
JOIN marks ON students.id = marks.student_id
GROUP BY students.id, students.name
ORDER BY average_mark DESC
LIMIT 5

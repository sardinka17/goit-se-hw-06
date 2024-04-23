-- 4. Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND (AVG(marks.mark)) as average_mark
FROM marks

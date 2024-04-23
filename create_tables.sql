-- table groups
DROP TABLE IF EXISTS groups CASCADE;
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- table students
DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- table teachers
DROP TABLE IF EXISTS teachers CASCADE;
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- table subjects
DROP TABLE IF EXISTS subjects CASCADE;
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(175) NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- table marks
DROP TABLE IF EXISTS marks CASCADE;
CREATE TABLE marks (
    id SERIAL PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    mark INTEGER CHECK (mark >= 0 AND mark <= 100),
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

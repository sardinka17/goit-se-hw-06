import logging
from random import randint

from faker import Faker
from psycopg2 import DatabaseError

fake = Faker('uk-Ua')


def fake_groups(cursor):
    for _ in range(3):
        cursor.execute('INSERT INTO groups(name) VALUES (%s)', (fake.word(),))


def fake_teachers(cursor):
    for _ in range(3):
        cursor.execute('INSERT INTO teachers(name) VALUES (%s)', (fake.name(),))


def fake_subjects(cursor):
    for teacher_id in range(1, 4):
        for _ in range(2):
            cursor.execute('INSERT INTO subjects(name, teacher_id) VALUES (%s, %s)', (fake.word(), teacher_id))


def fake_students_and_marks(cursor):
    for group_id in range(1, 4):
        for _ in range(10):
            cursor.execute('INSERT INTO students(name, group_id) VALUES (%s, %s)  RETURNING id',
                           (fake.name(), group_id))

            student_id = cursor.fetchone()[0]

            for subject_id in range(1, 7):
                for _ in range(3):
                    cursor.execute(
                        'INSERT INTO marks (student_id, subject_id, mark, created) VALUES (%s, %s, %s, %s)',
                        (student_id, subject_id, randint(0, 100), fake.date_this_decade()))


def fake_tables(connection):
    cursor = connection.cursor()

    try:
        fake_groups(cursor)
        fake_teachers(cursor)
        fake_subjects(cursor)
        fake_students_and_marks(cursor)

        connection.commit()
    except DatabaseError as error:
        logging.error(error)
        connection.rollback()
    finally:
        cursor.close()
        connection.close()

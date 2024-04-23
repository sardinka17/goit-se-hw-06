import logging

from psycopg2 import DatabaseError

from read_sql_file import read_sql_file


def create_tables(connection):
    cursor = connection.cursor()

    try:
        cursor.execute(read_sql_file('create_tables.sql'))
        connection.commit()
    except DatabaseError as error:
        logging.error(error)
        connection.rollback()
    finally:
        cursor.close()

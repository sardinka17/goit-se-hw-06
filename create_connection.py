from contextlib import contextmanager

from psycopg2 import connect, OperationalError


@contextmanager
def create_connection():
    try:
        connection = connect(host='localhost', database='postgres', user='postgres', password='123456789')
        yield connection
        connection.close()
    except OperationalError as error:
        raise RuntimeError(f'Failed to create database connection {error}')

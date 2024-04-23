import logging

from create_connection import create_connection
from create_tables import create_tables
from fake_tables import fake_tables
from run_queries import run_queries


def main():
    try:
        with create_connection() as connection:
            if connection is not None:
                create_tables(connection)
                fake_tables(connection)
                run_queries(connection)
            else:
                logging.error('Cannot create the database connection.')
    except RuntimeError as error:
        logging.error(error)


if __name__ == '__main__':
    main()

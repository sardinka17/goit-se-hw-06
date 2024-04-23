import logging

from psycopg2 import DatabaseError

from read_sql_file import read_sql_file

sql_queries = ['query_one.sql', 'query_two.sql', 'query_three.sql', 'query_four.sql', 'query_five.sql',
               'query_six.sql', 'query_seven.sql', 'query_eight.sql', 'query_nine.sql', 'query_ten.sql',
               'query_eleven.sql', 'query_twelve.sql']


def run_queries(connection):
    for query in sql_queries:
        cursor = connection.cursor()

        try:
            cursor.execute(read_sql_file(query))
            result = cursor.fetchall()
            print(result)
        except DatabaseError as error:
            logging.error(error)
            connection.rollback()
        finally:
            cursor.close()

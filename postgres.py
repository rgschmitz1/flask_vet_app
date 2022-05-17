import psycopg2
import psycopg2.extras
from psycopg2 import OperationalError
from dotenv import load_dotenv
from os import getenv

load_dotenv()

class postgres():
    def __create_connection(self):
        connection = None
        try:
            connection = psycopg2.connect(
                database=getenv('POSTGRES_DB'),
                user=getenv('POSTGRES_USER'),
                password=getenv('POSTGRES_PASS'),
                host=getenv('POSTGRES_HOST'),
                port=getenv('POSTGRES_PORT'),
            )
            print("Connection to PostgreSQL DB successful")
            return connection
        except OperationalError as e:
            print(f"The error '{e}' occurred")
            return False


    def execute_query(self, query):
        connection = self.__create_connection()
        connection.autocommit = True
        cursor = connection.cursor()
        try:
            cursor.execute(query)
            print("Query executed successfully")
            return True
        except Error as e:
            print(f"The error '{e}' occurred")
            return False


    def execute_read_query(self, query):
        connection = self.__create_connection()
        cursor = connection.cursor(cursor_factory=psycopg2.extras.DictCursor)
        result = None
        try:
            cursor.execute(query)
            result = cursor.fetchall()
            return result
        except OperationalError as e:
            print(f"The error '{e}' occurred")

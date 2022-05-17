import psycopg2
from psycopg2 import OperationalError
from dotenv import load_dotenv
from os import getenv

load_dotenv()

class postgres():
    def __init__(self):
        self.__connection = None
        try:
            self.__connection = psycopg2.connect(
                database=getenv('POSTGRES_DB'),
                user=getenv('POSTGRES_USER'),
                password=getenv('POSTGRES_PASS'),
                host=getenv('POSTGRES_HOST'),
                port=getenv('POSTGRES_PORT'),
            )
            print("Connection to PostgreSQL DB successful")
        except OperationalError as e:
            print(f"The error '{e}' occurred")
            return False


    def execute_query(self, query):
        self.__connection.autocommit = True
        cursor = self.__connection.cursor()
        try:
            cursor.execute(query)
            print("Query executed successfully")
            return True
        except Error as e:
            print(f"The error '{e}' occurred")
            return False


    def execute_read_query(self, query):
        cursor = self.__connection.cursor()
        result = None
        try:
            cursor.execute(query)
            result = cursor.fetchall()
            return result
        except OperationalError as e:
            print(f"The error '{e}' occurred")

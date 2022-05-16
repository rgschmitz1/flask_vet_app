import psycopg2
from psycopg2 import OperationalError
from dotenv import load_dotenv
from os import getenv

load_dotenv()

def create_connection():
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
    except OperationalError as e:
        print(f"The error '{e}' occurred")
    return connection


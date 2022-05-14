from dotenv import load_dotenv
from os import getenv

load_dotenv()
class Config:
    # Flask
    DEBUG = True
    FLASK_ENV = getenv("FLASK_ENV")
    SECRET_KEY = getenv("SECRET_KEY").encode()
    STATIC_FOLDER = "static"
    TEMPLATES_FOLDER = "templates"

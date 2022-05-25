"""
Flask configuration variables

@author: Bob Schmitz
"""

from dotenv import load_dotenv
from os import getenv

# Load .env variables for use in application
load_dotenv()

# Setup Flask configuration variables
class Config:
    # Flask
    DEBUG = True
    FLASK_ENV = getenv("FLASK_ENV")
    SECRET_KEY = getenv("SECRET_KEY").encode()
    STATIC_FOLDER = "static"
    TEMPLATES_FOLDER = "templates"

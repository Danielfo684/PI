import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    PORT = int(os.getenv("PORT", 5000))
    CLIENT_URL = os.getenv("CLIENT_URL", "http://proyectointegrado.hopto.org:5173")
    CLIENT_URL_LOCAL = os.getenv("CLIENT_URL_LOCAL", "http://localhost:5173")
    DB_HOST = os.getenv("DB_HOST", "localhost")
    DB_PORT = int(os.getenv("DB_PORT", 3306))
    DB_USER = os.getenv("DB_USER", "root")
    DB_PASSWORD = os.getenv("DB_PASSWORD", "root")
    DB_NAME = os.getenv("DB_NAME", "proyectointegrado")
    """ def __init__(self):
        print("DB_NAME:", self.DB_NAME) """

config = Config()
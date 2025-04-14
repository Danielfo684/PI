from dotenv import load_dotenv
import os

load_dotenv()

class Config:
    PORT = int(os.getenv("PORT", 5000))
    CLIENT_URL = os.getenv("CLIENT_URL", "http://localhost:5173")

config = Config()
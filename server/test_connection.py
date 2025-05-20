import mysql.connector
from mysql.connector import Error
from config import config

connection = None

try:
    connection = mysql.connector.connect(
         host=config.DB_HOST,
         port=config.DB_PORT,
         user=config.DB_USER,
         password=config.DB_PASSWORD,
         database=config.DB_NAME
    )
    if connection.is_connected():
         print("Conexión exitosa a MySQL")
         print(f"Versión de MySQL: {connection.server_info}")
except Error as e:
    print("Error al conectar:", e)
finally:
    if connection and connection.is_connected():
         connection.close()
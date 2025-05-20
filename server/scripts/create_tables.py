import os
import sys
# Agregamos la carpeta padre (PI/server) al path
# para que no nos de fallo la importacion de config
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

import mysql.connector
from mysql.connector import Error
from config import config

def execute_sql_script(script_path: str) -> None:
    connection = None
    try:
        connection = mysql.connector.connect(
            host=config.DB_HOST,
            port=config.DB_PORT,
            user=config.DB_USER,
            password=config.DB_PASSWORD,
            database=config.DB_NAME
        )
        cursor = connection.cursor()
        with open(script_path, "r") as file:
            sql_script = file.read()

        # Separa las sentencias por ';'
        statements = sql_script.split(';')
        for statement in statements:
            statement = statement.strip()
            if statement:
                print("Ejecutando:", statement)
                cursor.execute(statement)
        connection.commit()
        print("Script ejecutado correctamente.")
    except Error as e:
        print("Error ejecutando el script:", e)
    finally:
        if connection and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    execute_sql_script("scripts/create_tables.sql")
    # Ejecuto el script de inserción de datos después de crear las tablas
    execute_sql_script("scripts/insert_sample_data.sql")
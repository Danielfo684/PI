import os
import sys
import re
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

        sql_script = re.sub(r'/\*.*?\*/', '', sql_script, flags=re.DOTALL)
        sql_script = '\n'.join([line for line in sql_script.splitlines() if not line.strip().startswith('--') and not set(line.strip()) == {"-"}])
        statements = [stmt.strip() for stmt in sql_script.split(';') if stmt.strip()]

        for statement in statements:
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
    execute_sql_script("scripts/insert_sample_data.sql")
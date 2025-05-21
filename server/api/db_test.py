from flask import Blueprint, jsonify
import mysql.connector
from mysql.connector import Error
from config import config

db_api = Blueprint("db_api", __name__)

@db_api.route("/db_test")
def db_test():
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
            version = connection.server_info
            return jsonify(message=f"Conexión exitosa a MySQL versión {version}")
    except Error as e:
        return jsonify(error=str(e)), 500
    finally:
        if connection and connection.is_connected():
            connection.close()
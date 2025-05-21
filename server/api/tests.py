from flask import Blueprint, jsonify, session
import mysql.connector
from mysql.connector import Error
from config import config

tests_api = Blueprint("tests_api", __name__)

@tests_api.route("/api/tests", methods=["GET"])
def get_tests():
    if "user_id" not in session:
        return jsonify(error="No autenticado"), 401
    user_id = session["user_id"]
    connection = None
    try:
        connection = mysql.connector.connect(
            host=config.DB_HOST,
            port=config.DB_PORT,
            user=config.DB_USER,
            password=config.DB_PASSWORD,
            database=config.DB_NAME
        )
        cursor = connection.cursor(dictionary=True)
        query = "SELECT id, title, description FROM tests WHERE user_id = %s"
        cursor.execute(query, (user_id,))
        tests = cursor.fetchall()
        return jsonify(tests=tests), 200
    except Error as e:
        return jsonify(error=str(e)), 500
    finally:
        if connection and connection.is_connected():
            connection.close()
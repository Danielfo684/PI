from flask import Blueprint, jsonify, session
import mysql.connector
from mysql.connector import Error
from config import config

user_api = Blueprint("user_api", __name__)

@user_api.route("/api/user", methods=["GET"])
def get_user():
    # el usuario esta logueado si o si porque he protegido la ruta de /user
    user_id = session["user_id"]

    try:
        connection = mysql.connector.connect(
            host=config.DB_HOST,
            port=config.DB_PORT,
            user=config.DB_USER,
            password=config.DB_PASSWORD,
            database=config.DB_NAME
        )
        cursor = connection.cursor(dictionary=True)
        query = """
            SELECT 
                username AS name, 
                email
            FROM users 
            WHERE id = %s
        """
        cursor.execute(query, (user_id,))
        user_data = cursor.fetchone()
        if not user_data:
            return jsonify(error="Usuario no encontrado"), 404
        return jsonify(user=user_data)
    except Error as e:
        return jsonify(error=str(e)), 500
    finally:
        if connection and connection.is_connected():
            connection.close()
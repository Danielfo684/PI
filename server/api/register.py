from flask import Blueprint, request, jsonify, session
import mysql.connector
from mysql.connector import Error
import hashlib
from config import config

register_api = Blueprint("register_api", __name__)

@register_api.route("/register", methods=["POST"])
def register():
    data = request.get_json()
    username = data.get("username")
    email = data.get("email")
    password = data.get("password")

    # Validación básica
    if not username or not email or not password:
        return jsonify(error="Faltan datos de registro"), 400

    hashed_password = hashlib.sha256(password.encode()).hexdigest()
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
        query = "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)"
        cursor.execute(query, (username, email, hashed_password))
        connection.commit()
        return jsonify(message="Registro exitoso"), 200
    except Error as e:
        if "Duplicate entry" in str(e):
            return jsonify(error="El nombre de usuario o el email ya existen"), 400
        return jsonify(error=str(e)), 500
    finally:
        if connection and connection.is_connected():
            connection.close()
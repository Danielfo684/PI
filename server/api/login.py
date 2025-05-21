from flask import Blueprint, request, jsonify, session
import mysql.connector
from mysql.connector import Error
import hashlib
from config import config

login_api = Blueprint("login_api", __name__)

@login_api.route("/login", methods=["POST", "OPTIONS"])
def login():
    if request.method == "OPTIONS":
        return "", 200

    data = request.get_json()
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify(error="Faltan datos de autenticación"), 400

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
        query = "SELECT * FROM users WHERE email = %s"
        cursor.execute(query, (email,))
        user = cursor.fetchone()

        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        if user and user["password"] == hashed_password:
            session["user_id"] = user["id"]
            return jsonify(message="Login exitoso", user=user), 200
        else:
            return jsonify(error="Credenciales incorrectas"), 401
    except Error as e:
        return jsonify(error=str(e)), 500
    finally:
        if connection and connection.is_connected():
            connection.close()
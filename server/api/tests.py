from flask import Blueprint, jsonify, session, request
import mysql.connector
from mysql.connector import Error
from config import config

tests_api = Blueprint("tests_api", __name__)

#  Solicitar todos los tests de un usuario privados y ver los publicos
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
        query = """
            SELECT id, title, description, is_public 
            FROM tests 
            WHERE is_public = TRUE OR user_id = %s
            ORDER BY created_at DESC
        """
        cursor.execute(query, (user_id,))
        tests = cursor.fetchall()
        return jsonify(tests=tests), 200
    except Error as e:
        return jsonify(error=str(e)), 500
    finally:
        if connection and connection.is_connected():
            connection.close()

# Crear un test con un usuario
@tests_api.route("/api/tests", methods=["POST"])
def create_test():
    if "user_id" not in session:
        return jsonify(error="No autenticado"), 401

    data = request.get_json()
    title = data.get("title")
    description = data.get("description")
    is_public = data.get("is_public", False)
    questions = data.get("questions", [])
    
    if not title:
        return jsonify(error="El título es obligatorio"), 400

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
        cursor = connection.cursor()
        # Insertar test
        query_test = "INSERT INTO tests (title, description, user_id, is_public) VALUES (%s, %s, %s, %s)"
        cursor.execute(query_test, (title, description, user_id, is_public))
        test_id = cursor.lastrowid

        # Iterar sobre cada pregunta
        for question in questions:
            question_text = question.get("questionText")
            if question_text:
                query_question = "INSERT INTO questions (test_id, question_text) VALUES (%s, %s)"
                cursor.execute(query_question, (test_id, question_text))
                question_id = cursor.lastrowid

                answers = question.get("answers", [])
                for answer in answers:
                    answer_text = answer.get("answerText")
                    is_correct = answer.get("isCorrect", False)
                    if answer_text:
                        query_answer = "INSERT INTO answers (question_id, answer_text, is_correct) VALUES (%s, %s, %s)"
                        cursor.execute(query_answer, (question_id, answer_text, is_correct))
        connection.commit()
        return jsonify(message="Test creado correctamente", test_id=test_id), 200

    except Error as e:
        return jsonify(error=str(e)), 500

    finally:
        if connection and connection.is_connected():
            connection.close()

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
            SELECT id, title, description, is_public, user_id
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

# Obtener un test por su ID
@tests_api.route('/api/tests/<int:test_id>', methods=['GET'])
def get_test(test_id):
    # Implementa la lógica para obtener el test por ID
    try:
        # Por ejemplo, consulta a la base de datos
        test = get_test_from_db(test_id)  # función que recupera el test
        if test:
            return jsonify(test=test), 200
        else:
            return jsonify(error="Test no encontrado"), 404
    except Exception as e:
        return jsonify(error=str(e)), 500

def get_test_from_db(test_id: int) -> dict:
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
        # Recuperar información del test
        query_test = "SELECT id, title, description, is_public, user_id FROM tests WHERE id = %s"
        cursor.execute(query_test, (test_id,))
        test = cursor.fetchone()
        if not test:
            return None

        # Recuperar las preguntas del test
        query_questions = "SELECT id, question_text FROM questions WHERE test_id = %s"
        cursor.execute(query_questions, (test_id,))
        questions = cursor.fetchall()

        # Para cada pregunta, recuperar las respuestas
        for question in questions:
            query_answers = "SELECT id, answer_text, is_correct FROM answers WHERE question_id = %s"
            cursor.execute(query_answers, (question["id"],))
            answers = cursor.fetchall()
            question["answers"] = answers

        test["questions"] = questions
        return test
    except Exception as e:
        print("Error en get_test_from_db:", e)
        return None
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

# Editar un test
@tests_api.route("/api/tests/<int:test_id>", methods=["PUT"])
def update_test(test_id):
    if "user_id" not in session:
        return jsonify(error="No autenticado"), 401

    data = request.get_json()
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

        # Verifica que el test exista y pertenezca al usuario
        query_select = "SELECT user_id FROM tests WHERE id = %s"
        cursor.execute(query_select, (test_id,))
        test = cursor.fetchone()
        if not test:
            return jsonify(error="Test no encontrado"), 404
        if test["user_id"] != user_id:
            return jsonify(error="No autorizado"), 403

        # Actualiza los campos: título, descripción e is_public
        query_update = """
            UPDATE tests
            SET title = %s, description = %s, is_public = %s
            WHERE id = %s
        """
        cursor.execute(
            query_update,
            (
                data.get("title"),
                data.get("description"),
                data.get("is_public", False),
                test_id,
            ),
        )
        connection.commit()
        return jsonify(message="Test actualizado correctamente"), 200

    except Error as e:
        return jsonify(error=str(e)), 500

    finally:
        if connection and connection.is_connected():
            connection.close()

# Borrar test
@tests_api.route("/api/tests/<int:test_id>", methods=["DELETE"])
def delete_test(test_id):
    if "user_id" not in session:
        return jsonify(error="No autenticado"), 401

    user_id = session["user_id"]

    try:
        connection = mysql.connector.connect(
            host=config.DB_HOST,
            port=config.DB_PORT,
            user=config.DB_USER,
            password=config.DB_PASSWORD,
            database=config.DB_NAME
        )
        cursor = connection.cursor()

        # Verifica que el test existe y pertenece al usuario
        query_select = "SELECT user_id FROM tests WHERE id = %s"
        cursor.execute(query_select, (test_id,))
        result = cursor.fetchone()
        if not result:
            return jsonify(error="Test no encontrado"), 404
        if result[0] != user_id:
            return jsonify(error="No autorizado"), 403

        # Eliminar respuestas asociadas a las preguntas del test
        query_delete_answers = """
            DELETE a FROM answers a
            JOIN questions q ON a.question_id = q.id
            WHERE q.test_id = %s
        """
        cursor.execute(query_delete_answers, (test_id,))

        # Eliminar las preguntas del test
        query_delete_questions = "DELETE FROM questions WHERE test_id = %s"
        cursor.execute(query_delete_questions, (test_id,))

        # Eliminar el test
        query_delete_test = "DELETE FROM tests WHERE id = %s"
        cursor.execute(query_delete_test, (test_id,))

        connection.commit()
        return jsonify(message="Test eliminado correctamente"), 200

    except Error as e:
        return jsonify(error=str(e)), 500

    finally:
        if connection and connection.is_connected():
            connection.close()
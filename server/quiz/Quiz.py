import mysql.connector
from config import config

class Quiz:
    def __init__(self, quiz_id):
        self.quiz_id = quiz_id
        self.questions = self.load_questions_from_db(quiz_id)
        self.current_index = 1

    def load_questions_from_db(self, quiz_id):
        connection = mysql.connector.connect(
            host=config.DB_HOST,
            port=config.DB_PORT,
            user=config.DB_USER,
            password=config.DB_PASSWORD,
            database=config.DB_NAME
        )
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT id, question_text FROM questions WHERE test_id = %s", (quiz_id,))
        questions = cursor.fetchall()
        for question in questions:
            cursor.execute("SELECT id, answer_text, is_correct FROM answers WHERE question_id = %s", (question["id"],))
            answers = cursor.fetchall()
            question["answers"] = answers
        cursor.close()
        connection.close()
        print (f"Preguntas cargadas desde la base de datos para el quiz {quiz_id}: {questions}")
        return questions

    def get_question(self):
        if self.current_index <= len(self.questions):
            question = self.questions[self.current_index]
            self.current_index += 1
            print (f"Pregunta obtenida: {question}")
            return question
        else:
            return None

    def get_questions(self):
        return self.questions
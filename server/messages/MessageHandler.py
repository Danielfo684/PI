import json
import logging
from socketio import Server

class MessageHandler:
    def __init__(self, socket: Server):
        self.socket = socket
        self.questions = self._load_questions()
        self.register_handlers()

    def _load_questions(self):
        try:
            with open("preguntas.json", "r", encoding="utf-8") as f:
                data = json.load(f)
                return data.get("questions", [])
        except Exception as e:
            logging.error("Error cargando preguntas: %s", e)
            return []

    def register_handlers(self):
        @self.socket.on("request_question")
        def handle_request_question(data):
            question_id = data.get("question_id")
            if question_id is None:
                question = self.questions[0] if self.questions else {}
            else:
                question = next((q for q in self.questions if q["id"] == int(question_id)), {})
            if question:
                self.socket.emit("question", question)
                logging.info("Enviada pregunta: %s", question)
            else:
                self.socket.emit("error", {"message": "Pregunta no encontrada"})

        @self.socket.on("submit_answer")
        def handle_submit_answer(data):
            question_id = data.get("question_id")
            answer_id = data.get("answer_id")
            if question_id is None or answer_id is None:
                self.socket.emit("error", {"message": "Datos insuficientes en submit_answer"})
                return
            question = next((q for q in self.questions if q["id"] == int(question_id)), None)
            if question:
                answer = next((a for a in question.get("answers", []) if a["id"] == int(answer_id)), None)
                if answer is not None:
                    correct = answer.get("isCorrect", False)
                    self.socket.emit("answer_result", {"correct": correct})
                    logging.info("Respuesta recibida para la pregunta %s: respuesta %s; correcta: %s", question_id, answer_id, correct)
                else:
                    self.socket.emit("error", {"message": "Respuesta no encontrada"})
            else:
                self.socket.emit("error", {"message": "Pregunta no encontrada"})
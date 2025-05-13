import logging
from game.GameService import GameService

def do_request_question(service, sid, data):
    question_id = data.get("question_id")
    questions = GameService.get_instance().get_questions()
    if question_id is None:
        question = questions[0] if questions else {}
    else:
        question = next((q for q in questions if q["id"] == int(question_id)), {})
    if question:
        service.io.emit("question", question, room=sid)
        logging.info("Enviada pregunta (REQUEST_QUESTION): %s", question)
    else:
        service.io.emit("error", {"message": "Pregunta no encontrada"}, room=sid)

def do_submit_answer(service, sid, data):
    question_id = data.get("question_id")
    answer_id = data.get("answer_id")
    if question_id is None or answer_id is None:
        service.io.emit("error", {"message": "Datos insuficientes en submit_answer"}, room=sid)
        return
    questions = GameService.get_instance().get_questions()
    question = next((q for q in questions if q["id"] == int(question_id)), None)
    if question:
        answer = next((a for a in question.get("answers", []) if a["id"] == int(answer_id)), None)
        if answer is not None:
            correct = answer.get("isCorrect", False)
            service.io.emit("answer_result", {"correct": correct}, room=sid)
            logging.info("Respuesta recibida para la pregunta %s: respuesta %s; correcta: %s", question_id, answer_id, correct)
        else:
            service.io.emit("error", {"message": "Respuesta no encontrada"}, room=sid)
    else:
        service.io.emit("error", {"message": "Pregunta no encontrada"}, room=sid)
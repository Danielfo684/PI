import logging

questions = [
            {
                "id": 1,
                "text": "¿Cuál es la capital de Francia?",
                "answers": [
                    {"id": 1, "text": "Madrid", "isCorrect": False},
                    {"id": 2, "text": "París", "isCorrect": True},
                    {"id": 3, "text": "Berlín", "isCorrect": False},
                ],
            },
            {
                "id": 2,
                "text": "¿2 + 2 = ?",
                "answers": [
                    {"id": 1, "text": "3", "isCorrect": False},
                    {"id": 2, "text": "4", "isCorrect": True},
                    {"id": 3, "text": "22", "isCorrect": False},
                ],
            },
        ]
class Quiz:
    def __init__(self):
        # También lo tendremos que cambiar para que se asignen las preugntas cuando tengamos la base de datos
        self.questions = questions
        self.current_question = 1

    def get_question(self):
        question = next(
            (q for q in self.questions if q["id"] == self.current_question), None
        )
        if question:
            self.current_question += 1
            return question
        else:
            return None

    def load_questions(self):
        return questions

    def get_questions(self):
        return self.questions


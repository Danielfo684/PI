import logging

class GameService:
    _instance = None

    def __init__(self):
        self.players = {}
        self.questions = self._load_questions()

    @classmethod
    def get_instance(cls):
        if not cls._instance:
            cls._instance = GameService()
        return cls._instance

    def _load_questions(self):
        return [
            {
                "id": 1,
                "text": "¿Cuál es la capital de Francia?",
                "answers": [
                    {"id": 1, "text": "Madrid", "isCorrect": False},
                    {"id": 2, "text": "París", "isCorrect": True},
                    {"id": 3, "text": "Berlín", "isCorrect": False}
                ]
            },
            {
                "id": 2,
                "text": "¿2 + 2 = ?",
                "answers": [
                    {"id": 1, "text": "3", "isCorrect": False},
                    {"id": 2, "text": "4", "isCorrect": True},
                    {"id": 3, "text": "22", "isCorrect": False}
                ]
            }
        ]

    def get_questions(self):
        return self.questions

    def build_player(self, sid):
        return {"id": sid, "score": 0}

    def add_player(self, player):
        self.players[player["id"]] = player
        logging.info("Jugador agregado: %s", player["id"])
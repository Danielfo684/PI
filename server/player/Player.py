class Player:
    def __init__(self, id: str, name: str, sid: str = None, points: int = 0):
        self.id = id
        self.name = name
        self.sid = sid
        self.icon_number = id
        self.points = points

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "iconNumber": self.icon_number,
            "points": self.points
        }
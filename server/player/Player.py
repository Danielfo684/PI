
class Player:
    def __init__(self, id: str, name: str, points: int = 0):
        self.id = id
        self.name = name
        self.icon_number = id
        self.points = points

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "iconNumber": self.icon_number,
            "points": self.points
        }
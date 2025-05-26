import random
import threading
from player.Player import Player
from quiz.Quiz import Quiz


class Room:
    def __init__(self, name: str, players=None, occupied: bool = False, quiz=None):
        self.name = name
        self.players = players if players is not None else []
        self.occupied = occupied
        self.quiz = quiz
        self.remaining_time = 0
        self.timer_thread = None

    def set_remaining_time(self, seconds=20, on_time_end=None):
        self.remaining_time = seconds
        if self.timer_thread and self.timer_thread.is_alive():
            return  

        def countdown():
            while self.remaining_time > 0:
                print(f"Tiempo restante en la pregunta de la sala {self.name}: {self.remaining_time}")
                self.remaining_time -= 1
                threading.Event().wait(1)
            print(f"¡Tiempo terminado en la pregunta de la sala {self.name}!")
            if on_time_end:
                on_time_end()  

        self.timer_thread = threading.Thread(target=countdown, daemon=True)
        self.timer_thread.start()


class RoomConfig:
    maxRoomPlayers = 3


class RoomService:
    _instance = None

    def __init__(self):
        self.rooms = []

    @classmethod
    def get_instance(cls):
        if cls._instance is None:
            cls._instance = RoomService()
        return cls._instance

    def create_room(self, data):
        room_name = self.gen_ran_hex()
        new_quiz = Quiz()
        new_room = Room(name=room_name, quiz=new_quiz)
        self.rooms.append(new_room)
        return room_name

    def gen_ran_hex(self, size: int = 4) -> str:
        return f"{random.randint(0, 9999):04d}"

    def get_room(self, room_code) -> Room:
        for room in self.rooms:
            if room.name == room_code:
                print("Sala encontrada:", room.name)
                return room
        return None

    def get_room_by_player_id(self, player_id: str) -> Room:
        for room in self.rooms:
            if any(getattr(player, "id", None) == player_id for player in room.players):
                return room
        return None

    def add_player(self, sid, data, room) -> Player:

        player_id = len(room.players) + 1
        player = Player(
            id=player_id,
            name=data.get("playerName"),
        )
        room.players.append(player)
        if len(room.players) == RoomConfig.maxRoomPlayers:
            room.occupied = True
        else:
            room.occupied = False
        return player

    def find_player(self, player_id: str):
        for room in self.rooms:
            for player in room.players:
                if getattr(player, "id", None) == player_id:
                    return player
        return None

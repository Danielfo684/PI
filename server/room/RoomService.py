import random
import logging

class Room:
    def __init__(self, name: str, players=None, occupied: bool = False):
        self.name = name
        self.players = players if players is not None else []
        self.occupied = occupied

class RoomConfig:
    maxRoomPlayers = 25  

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
        new_room = Room(name=room_name)
        self.rooms.append(new_room)
        return room_name
    
    def gen_ran_hex(self, size: int = 4) -> str:
        return f"{random.randint(0, 9999):04d}"
    
    def get_room(self) -> Room:
        for room in self.rooms:
            if not room.occupied:
                return room
        room_name = "room" + self._gen_ran_hex(128)
        new_room = Room(name=room_name)
        self.rooms.append(new_room)
        return new_room

    def get_room_by_player_id(self, player_id: str) -> Room:
        for room in self.rooms:
            if any(getattr(player, "id", None) == player_id for player in room.players):
                return room
        logging.info("Sala no encontrada para el jugador: %s", player_id)
        return None

    def add_player(self, player) -> Room:
        room = self._get_room()
        room.players.append(player)
        if len(room.players) == RoomConfig.maxRoomPlayers:
            room.occupied = True
        return room

    def find_player(self, player_id: str):
        for room in self.rooms:
            for player in room.players:
                if getattr(player, "id", None) == player_id:
                    return player
        return None
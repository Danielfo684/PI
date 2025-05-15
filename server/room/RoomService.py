import random
import logging

class Room:
    def __init__(self, key: str, players=None, occupied: bool = False):
        self.key = key
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

    def _gen_ran_hex(self, size: int) -> str:
        return ''.join(random.choice('0123456789abcdef') for _ in range(size))

    def _get_room(self) -> Room:
        for room in self.rooms:
            if not room.occupied:
                return room
        room_key = "room" + self._gen_ran_hex(128)
        new_room = Room(key=room_key)
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
import random
import logging
from player.Player import Player

class Room:
    def __init__(self, name: str, players=None, occupied: bool = False):
        self.name = name
        self.players = players if players is not None else []
        self.occupied = occupied


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
        new_room = Room(name=room_name)
        self.rooms.append(new_room)
        return room_name

    def gen_ran_hex(self, size: int = 4) -> str:
        return f"{random.randint(0, 9999):04d}"

    def get_room(self, room_code) -> Room:
        for room in self.rooms:
            if room.name == room_code:
                print("Sala encontrada: %s", room.name)
                return room
        return None

    def get_room_by_player_id(self, player_id: str) -> Room:
        for room in self.rooms:
            if any(getattr(player, "id", None) == player_id for player in room.players):
                return room
        return None

    def add_player(self, sid, data, room_code) -> Player:
        room = self.get_room(room_code)
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

import socketio
import logging

class ServerService:
    _instance = None
    messages = {
        "out": {
            "new_player": "NEW_PLAYER"
        }
    }
    
    def __init__(self, io: socketio.Server = None):
        self.io = io
        self.active = bool(io)

    @classmethod
    def get_instance(cls, io: socketio.Server = None):
        if cls._instance is None:
            cls._instance = ServerService(io)
        return cls._instance

    def add_player_to_room(self, id, room):
        if self.io:
            self.io.enter_room(id, str(room))
            logging.info("Jugador %s añadido a la sala %s", id, room)

    def send_message(self, room, type, content):
        if self.active and self.io is not None and room is not None:
            self.io.emit("message", {"type": type, "content": content}, room=str(room))
            logging.info("Mensaje enviado a la sala %s: %s", room, content)

    def is_active(self):
        return self.active
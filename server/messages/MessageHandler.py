import socketio
import logging
from game.GameService import GameService
from . import messageActions  

class MessageHandler:
    _instance = None

    def __init__(self, io: socketio.Server = None):
        self.io = io
        self.active = bool(io)
        actions = messageActions.get_message_actions()
        self.messages = [
            {
                "type": key, 
                "do": lambda sid, data, func=func: func(self, sid, data)
            }
            for key, func in actions.items()
        ]

    @classmethod
    def get_instance(cls, io: socketio.Server = None):
        if cls._instance is None:
            cls._instance = cls(io)
        return cls._instance

    def init(self, http_server):
        self.io = socketio.Server(cors_allowed_origins="*", async_mode="eventlet")
        self.active = True

        @self.io.event
        def connect(sid, environ):
            print("Un cliente se ha conectado:", sid)
            self.io.emit("connectionStatus", {"status": True}, room=sid)
            game_service = GameService.get_instance()
            player = game_service.build_player(sid)
            game_service.add_player(player)

        @self.io.event
        def disconnect(sid):
            print("Un cliente se ha desconectado:", sid)

        @self.io.on("message")
        def on_message(sid, data):
            message_type = data.get("type")
            handler = next((item["do"] for item in self.messages if item["type"] == message_type), None)
            if handler:
                handler(sid, data)
            else:
                logging.warning("Mensaje no soportado: %s", message_type)

    def add_player_to_room(self, sid, room: str):
        self.io.enter_room(sid, str(room))

    def send_message(self, room: str, type: str, content):
        print(content)
        if self.active and self.io is not None and room is not None:
            self.io.emit("message", {"type": type, "content": content}, room=str(room))

    def is_active(self):
        return self.active
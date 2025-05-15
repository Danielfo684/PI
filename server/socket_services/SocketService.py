import socketio
from flask import request
from .message_actions import get_message_actions
class SocketService:
    _instance = None
    messages = {
        "out": {
            "new_player": "NEW_PLAYER",
            "room_status": "ROOM_STATUS",
            "players_ready": "PLAYERS_READY"
        }
    }

    def __init__(self, socket: socketio.Server):
        self.socket = socket
        self.active = False
        

    @classmethod
    def get_instance(cls, socket: socketio.Server = None): # Se suele usar "cls" para referirse a la propa clase
        if cls._instance is None:
            if socket is None:
                raise ValueError("Se requiere una instancia de Socket.IO para la inicialización")
            cls._instance = cls(socket)
        return cls._instance

    def register_events(self):
        @self.socket.event
        def connect(sid, environ):  # No necesita parámetros id y callback
            sid = request.sid  # Necesitas importar request de flask
            print(f"Un cliente se ha conectado: {sid}")
            # Puedes usar sid como identificador del cliente
            
        @self.socket.event
        def disconnect(sid):  # No necesita parámetro id
            sid = request.sid
            print("Un cliente se ha desconectado: {sid}")
            
        @self.socket.on("message")
        def on_message(sid, data):  # Solo recibe el payload, no el id
            sid = request.sid
            print(f"Mensaje recibido en el server de {sid}")
            print(f"Contenido: {data}")
            if isinstance(data, dict) and "type" in data:
                message_type = data.get("type")
                actions = get_message_actions()
                if message_type in actions:
                    actions[message_type](self, sid, data)
                else:
                    print(f"No hay acción para el tipo de mensaje: {message_type}")              
    def init(self):
        self.register_events()  # Añade esta línea
        self.active = True
        print("Socket service initialized and active")
        return self
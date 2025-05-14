import socketio

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
        def connect(id, callback):
            print("Un cliente se ha conectado:", id)

        @self.socket.event
        def disconnect(id):
            print("Un cliente se ha desconectado:", id)

        @self.socket.on("message")
        def on_message(id, payload):
                print(f"mensaje recibido en el server de {id}")
                print(f"contenido {payload}")
                      
    def init(self):
        self.active = True
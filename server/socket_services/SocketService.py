import socketio
from socket_services import message_actions

class SocketService:
    _instance = None
    messages = {
        "in": {
            "CREATE_ROOM": "do_create_room",
            "JOIN_ROOM": "do_join_room",
            "START_GAME": "do_start_game",
            "QUESTION": "do_send_question",
            "ANSWER": "do_submit_answer",
            "PLAYER_LIST": "do_send_player_list",
            "QUICK_PLAYER": "do_quick_player",
            "END_GAME": "do_end_game",
            "KICK_PLAYER": "do_kick_player",
        },
    }

    def __init__(self, socket: socketio.Server):
        self.socket = socket
        self.active = False
        self.register_events()

    @classmethod
    def get_instance(cls, socket: socketio.Server = None):
        if cls._instance is None:
            if socket is None:
                raise ValueError(
                    "Se requiere una instancia de Socket.IO para la inicialización"
                )
            cls._instance = cls(socket)
        return cls._instance

    def register_events(self):
        @self.socket.event
        def connect(id, callback):
            print("Un cliente se ha conectado:", id)

        @self.socket.event
        def disconnect(id):
            print("Un cliente se ha desconectado:", id)

        @self.socket.event
        def message(id, data):
            msg_type = data.get("type")
            content = data.get("content")
            valid_types = self.messages["in"].keys()
            if msg_type not in valid_types:
                print(f"Tipo de mensaje no válido: {msg_type}")
                return
            else:
                print(f"Mensaje recibido de {id}: tipo={msg_type}, contenido={content}")
                action_name = self.messages["in"][msg_type]
                action = getattr(message_actions, action_name, None)
                if callable(action):
                    action(self, id, content)
                else:
                    print(
                        f"No se encontró la acción '{action_name}' en message_actions.py"
                    )

    def init(self):
        self.active = True
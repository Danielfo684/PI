import logging
from room.RoomService import RoomService
import threading
       
def do_create_room(service, sid, data):
    room_service = RoomService.get_instance()
    generated_room = room_service.create_room(data)
    service.socket.emit("message", {"type": "ROOM_CODE", "content": generated_room}) 
    

def get_message_actions():
    return {
        "REQUEST_QUESTION": do_request_question,
        "SUBMIT_ANSWER": do_submit_answer,
        "CREATE_ROOM": do_create_room,
    }

def do_join_room(service, sid, data):
    room_code = data.get("roomCode")
    print(f"Intentando unirse a la sala: {room_code}")
    room_service = RoomService.get_instance()
    room = room_service.get_room(room_code)
    if room is None:
        service.socket.emit("message", {"type": "JOIN_ERROR", "content": room})
    else:
        player = room_service.add_player(sid, data, room)
        print(f"Player creado: {player.to_dict()}")
        service.socket.emit("message", {"type": "JOIN_PLAYER", "content": player.to_dict()})

def do_start_game(service, sid, data):
    room_code = data.get("roomCode")
    print(f"Intentando iniciar el juego en la sala: {room_code}")
    room_service = RoomService.get_instance()
    room = room_service.get_room(room_code)
    if room is None:
        service.socket.emit("message", {"type": "JOIN_ERROR", "content": room})
    else:
        gameQuestion = room.quiz.get_question()
        service.socket.emit("message", {"type": "START_GAME", "content": "Starting game..."})
        def send_question():
            service.socket.emit("message", {"type": "QUESTION", "content": gameQuestion})
        threading.Timer(10.0, send_question).start()
        print(f"Pregunta enviada: {gameQuestion}")
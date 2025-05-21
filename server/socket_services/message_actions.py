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
        service.socket.emit(
            "message", {"type": "JOIN_PLAYER", "content": player.to_dict()}
        )


def do_start_game(service, sid, data):
    room = find_room(service, data)
    if room:
        gameQuestion = room.quiz.get_question()
        # Aquí podría mandar en content el tiempo que estableceré como base para que se inicie el juego
        service.socket.emit(
            "message", {"type": "START_GAME", "content": "Starting game..."}
        )


def do_send_question(service, sid, data):
    room = find_room(service, data)
    if room:
        gameQuestion = room.quiz.get_question()
        service.socket.emit("message", {"type": "QUESTION", "content": gameQuestion})

        def on_time_end():
            # Envía mensaje para quitar la pregunta al cliente
            service.socket.emit("message", {"type": "HIDE_QUESTION", "content": {"roomCode": room.name}})
            print(f"Mensaje enviado para ocultar la pregunta en la sala {room.name}")

        room.set_remaining_time(on_time_end=on_time_end)
        print(f"Pregunta enviada: {gameQuestion}")

def find_room(service, data):
    room_code = data.get("roomCode")
    print(f"Intentando encontrar la sala: {room_code}")
    room = RoomService.get_instance().get_room(room_code)
    if room is None:
        service.socket.emit(
            "message", {"type": "JOIN_ERROR", "content": "room not found"}
        )
    else:
        return room


def do_submit_answer(service, sid, data):
    room = find_room(service, data)
    if room:
        player = service.find_player(sid)
        if player:
            player.answer = data.get("answer")
            service.socket.emit(
                "message", {"type": "ANSWER_SUBMITTED", "content": "Answer submitted"}
            )
        else:
            service.socket.emit(
                "message", {"type": "PLAYER_NOT_FOUND", "content": "Player not found"}
            )

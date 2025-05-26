import logging
from room.RoomService import RoomService
import threading


def do_create_room(service, sid, data):
    room_service = RoomService.get_instance()
    generated_room = room_service.create_room(data)
    service.socket.emit("message", {"type": "ROOM_CODE", "content": generated_room})


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
        service.socket.emit(
            "message", {"type": "START_GAME", "content": "Starting game..."}
        )


def do_send_question(service, sid, data):
    room = find_room(service, data)
    if room:
        gameQuestion = room.quiz.get_question()
        service.socket.emit("message", {"type": "QUESTION", "content": gameQuestion})

        def on_time_end():
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
            answer_id = data.get("answer") or data.get("selection")
            question = room.quiz.current_question
            selected_answer = next((a for a in question.answers if a.id == answer_id), None)
            if selected_answer and selected_answer.is_correct:
                time_left = max(room.remaining_time, 0)
                score = 100 + int((time_left / 20) * 900)
                player.points += score
            else:
                score = 0
            player.answer = answer_id
            service.socket.emit(
                "message", {"type": "ANSWER_SUBMITTED", "content": {"score": score, "isCorrect": selected_answer.is_correct if selected_answer else False}}
            )
        else:
            service.socket.emit(
                "message", {"type": "PLAYER_NOT_FOUND", "content": "Player not found"}
            )

def send_player_list(service, room):
    players = [
        {
            "id": player.id,
            "name": player.name,
            "points": player.points,
            "iconNumber": getattr(player, "icon_number", 1)
        }
        for player in room.players
    ]
    service.socket.emit(
        "message", {"type": "PLAYER_LIST", "content": {"players": players}}
    )
import { JSX, useEffect, useState } from "react";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./JoinRoomPage.css";
import { GameController } from "../../services/GameController";
import { useNavigate } from "react-router-dom";

export function JoinRoomPage(): JSX.Element {
  usePageTitle("Join Game");
  const navigate = useNavigate();
  const [roomCode, setRoomCode] = useState<string>("");
  const [playerName, setPlayerName] = useState<string>("");
  const [joined, setJoined] = useState(false);
  const [player, setPlayer] = useState<any>({});

  const gameControllerInstance = GameController.getInstance();

  useEffect(() => {
    if (!gameControllerInstance.initialized) {
      gameControllerInstance.init("http://localhost:5000");
    }

    const socket = gameControllerInstance.getSocketService();
    const handleMessage = (payload: any) => {
      console.log("Mensaje recibido del socket", payload);
      if (payload.type === "JOIN_PLAYER") {
        setPlayer(payload.content);
        setJoined(true);
      } if (payload.type === "JOIN_ERROR") {
        console.error(`Error al unirse a la sala: ${payload.content}`);
        alert("Error al unirse a la sala. Por favor, verifica el código de la sala.");
      }
      if (payload.type === "START_GAME") {
        console.log("El juego ha comenzado");
        navigate("/game", { state: { player, roomCode } });
      }
    };

    if (socket) {
      socket.onMessage(handleMessage);
    }

    return () => {
      if (socket && socket.offMessage) {
        socket.offMessage(handleMessage);
      }
    
      localStorage.removeItem("roomCode");
      localStorage.removeItem("playerName");
    };
  }, [gameControllerInstance]);

  const handleJoin = async () => {
    const trimmedRoomCode = roomCode.trim();
    const trimmedPlayerName = playerName.trim();

    if (!trimmedRoomCode) {
      alert("Por favor, introduce el código de la sala.");
      return;
    }
    if (!trimmedPlayerName) {
      alert("Por favor, introduce tu nombre.");
      return;
    }

    setRoomCode(trimmedRoomCode);
    setPlayerName(trimmedPlayerName);

    gameControllerInstance.socketMessage({
      type: "JOIN_ROOM",
      content: {
        roomCode: trimmedRoomCode,
        playerName: trimmedPlayerName,
      },
    });
  };

  if (joined) {
    return (
      <div className="join-room-success">
        <h2>¡Te has unido correctamente a la sala!</h2>
        <p>Espera a que el juego comience...</p>
      </div>
    );
  }

  return (
    <>
      <h1>Unirse a una Sala</h1>
      <div className="join-room-container">
        <Input
          placeholder="Código de la sala"
          value={roomCode}
          onChange={(e) => setRoomCode(e.target.value)}
        />
        <Input
          placeholder="Nombre del jugador"
          value={playerName}
          onChange={(e) => setPlayerName(e.target.value)}
        />
        <Button text="Unirse" onClick={handleJoin} dataset="join-room" />
      </div>
    </>
  );
}
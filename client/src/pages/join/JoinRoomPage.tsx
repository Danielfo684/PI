import { JSX, useEffect, useRef, useState } from "react";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./JoinRoomPage.css";
import { GameController } from "../../services/GameController";
import { useNavigate } from "react-router-dom";
import { Footer } from "../../components/footer/Footer";
import { Floating } from "../../components/floatingButton/floatingButton";


export function JoinRoomPage(): JSX.Element {
  usePageTitle("Quizify - Unirse a partida");
  const navigate = useNavigate();
  const [roomCode, setRoomCode] = useState<string>(new URLSearchParams(window.location.search).get("roomCode") || "");
  const [playerName, setPlayerName] = useState<string>("");
  const [error, setError] = useState<string>("");
  const [joined, setJoined] = useState(false);
  const [bannedRoomCode, setBannedRoomCode] = useState<string | null>(null);
  const [kicked, setKicked] = useState(false);

  // const [myPlayerId, setMyPlayerId] = useState<number | null>(null);
  const hasJoinedSelf = useRef(false);
  const joinedPlayer = useRef<any>(null);
  const gameControllerInstance = GameController.getInstance();

  useEffect(() => {
    if (kicked) return;

    if (!gameControllerInstance.initialized) {
      gameControllerInstance.init("http://proyectointegrado.hopto.org:5000");
    }

    const socket = gameControllerInstance.getSocketService();
    const handleMessage = (payload: any) => {
      console.log("Mensaje recibido del socket", payload);
      if (payload.type === "JOIN_ERROR") {
        console.error(`Error al unirse a la sala: ${payload.content}`);
        setError(payload.content || "Error al unirse a la sala");
      }
      if (payload.type === "JOIN_PLAYER") {
        console.log("Jugador unido a la sala:", payload.content);
        if (!hasJoinedSelf.current) {
          joinedPlayer.current = payload.content;
          setJoined(true);
          hasJoinedSelf.current = true;
        }
      }
      if (payload.type === "PLAYER_KICKED") {
        console.error("Has sido expulsado de la sala");
        setError("Has sido expulsado de la sala");
        setJoined(false);
        hasJoinedSelf.current = false;
        setBannedRoomCode(roomCode);
        setRoomCode("");
        setPlayerName("");
        setKicked(true);
        joinedPlayer.current = null;
        if (socket && socket.disconnect) {
          socket.disconnect();
        }
        if (socket && socket.offMessage) {
          socket.offMessage(handleMessage);
        }
      }
      if (payload.type === "START_GAME") {
        console.log("El juego ha comenzado");
        navigate("/game", { state: { player: joinedPlayer.current, roomCode: roomCode } });
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
  }, [gameControllerInstance, playerName, roomCode, navigate]);

  const handleJoin = async () => {
    const trimmedRoomCode = roomCode.trim();
    const trimmedPlayerName = playerName.trim();

    if (!trimmedRoomCode) {
      setError("Por favor, introduce el código de la sala");
      return;
    }
    if (!trimmedPlayerName) {
      setError("Por favor, introduce tu nombre");
      return;
    }

    if (bannedRoomCode && trimmedRoomCode === bannedRoomCode) {
      setError("No puedes volver a unirte a esta sala porque has sido expulsado.");
      return;
    }

    setError("");

    setRoomCode(trimmedRoomCode);
    setPlayerName(trimmedPlayerName);
    const gameControllerInstance = GameController.getInstance();
    if (!gameControllerInstance.initialized) {
      gameControllerInstance.init("http://localhost:5000");
    }
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
      <div className="join-success-container">
        <div className="join-room-success">
          <h2>¡Te has unido correctamente a la sala!</h2>
          <p>Esperando a que el juego comience...</p>
        </div>
        <Footer />
      </div>
    );
  }

  return (
    <>
      <div id="top"></div>
      <Floating target="#top" />
      <div className="join-section">
        <h2>Unirse a partida</h2>
        <div className="join-room-container">
          {error && (
            <p className="error">
              <img
                src="/src/assets/images/error.png"
                alt="Error"
                className="error-icon"
              />
              {error}
            </p>
          )}
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
      </div>
      <Footer />
    </>
  );
}
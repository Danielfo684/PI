import { JSX, useEffect, useRef, useState } from "react";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./JoinRoomPage.css";
import { GameController } from "../../services/GameController";
import { useNavigate } from "react-router-dom";
import { Player } from "../../components/player/Player";
export function JoinRoomPage(): JSX.Element {
  usePageTitle("Join Game");

  const [roomCode, setRoomCode] = useState<string>("");
  const [playerName, setPlayerName] = useState<string>("");
  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const [gameControllerSocket, setGameControllerSocket] = useState(() => gameControllerInstance.getSocketService());
  const [joined, setJoined] = useState(false);
  const [player, setPlayer] = useState<any>({});

  useEffect(() => {
    gameControllerInstance.init("http://localhost:5000");
    setGameControllerSocket(gameControllerInstance.getSocketService());
    return () => {
      if (gameControllerSocket && gameControllerSocket.disconnect) {
        gameControllerSocket.disconnect();
      }
      if (gameControllerInstance && gameControllerInstance.reset) {
        gameControllerInstance.reset(); 
      }
      localStorage.removeItem("roomCode");
      localStorage.removeItem("playerName");
    };
    
  }, []);
  const handleJoin = async () => {
    gameControllerInstance.init("http://localhost:5000");
    gameControllerInstance.actionController({
      type: "JOIN_ROOM",
      content: {
        roomCode,
        playerName,
      },
    });
  };

  const handleMessage = (payload: any) => {
    console.log("Mensaje recibido del socket", payload);
    setJoined(true)
    if (payload.type === "JOIN_PLAYER") {
      setPlayer(payload.content);
      setJoined(true);
    }


    else if (payload.type === "JOIN_ERROR") {
      console.error(`Error al unirse a la sala: ${payload.content}`);
      alert("Error al unirse a la sala. Por favor, verifica el código de la sala.");
    }

  }


  useEffect(() => {
    if (gameControllerSocket) {
      gameControllerSocket.onMessage(handleMessage);
      return () => {
        if (gameControllerSocket.offMessage) {
          gameControllerSocket.offMessage(handleMessage);
        }
      };
    }
  }, [gameControllerSocket]);

  if (joined) {
    return (
      <div className="join-room-success">
        <h2>¡Te has unido correctamente a la sala!</h2>
        <p>Espera a que el juego comience...</p>
        <h1>Jugadores</h1>
        <div>

          <Player.PlayerCard
            key={player.id}
            id={player.id}
            name={player.name}
            className={player.className}
            iconNumber={player.iconNumber}
          />

        </div>
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
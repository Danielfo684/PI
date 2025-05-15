import { JSX, useState, useEffect } from "react";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./joinRoomPage.css";
import { GameController } from "../../services/GameController";

export function JoinRoomPage(): JSX.Element {
  usePageTitle("Join Game");

  const [roomCode, setRoomCode] = useState<string>("");
  const [playerName, setPlayerName] = useState<string>("");
  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const handleJoin = async () => {
    console.log(
      "Intentando unirse a la sala:",
      roomCode,
      "con el nombre:",
      playerName
    );

    // await gameControllerInstance.init("http://localhost:5000");
    // console.log("Promesa terminada");
    // gameControllerInstance.actionController({ type: "CREATE_ROOM", content: data.id });
    // console.log(`Mensaje enviado al servidor para iniciar el quiz con ID: ${data.id}`);


  };

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

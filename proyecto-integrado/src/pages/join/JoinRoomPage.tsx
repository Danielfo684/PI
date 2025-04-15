import { JSX, useState, useEffect } from "react";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./joinRoomPage.css";

export function JoinRoomPage(): JSX.Element {
  usePageTitle("Join Game");

  const [roomCode, setRoomCode] = useState<string>("");
  const [playerName, setPlayerName] = useState<string>("");

  const handleJoin = () => {
    console.log(
      "Intentando unirse a la sala:",
      roomCode,
      "con el nombre:",
      playerName
    );
    // DANI AQUI LA LOGICA PARA UNIRSE A LA SALA, SOCKET.IO O LO QUE SEA
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

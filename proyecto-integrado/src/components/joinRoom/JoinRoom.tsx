import { JSX, useState } from "react";


interface JoinRoomProps {
  onJoin: (roomCode: string, playerName: string) => void;
}

export default function JoinRoom({ onJoin }: JoinRoomProps): JSX.Element {
  const [roomCode, setRoomCode] = useState<string>("");
  const [playerName, setPlayerName] = useState<string>("");

  const handleJoin = (): void => {
    if (roomCode && playerName) {
      onJoin(roomCode, playerName);
    }
  };
 
  return (
    <></>
  )
}

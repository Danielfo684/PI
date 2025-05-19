import { JSX, useState, useEffect, useRef } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import { useLocation } from "react-router-dom";
import "./HostingGamePage.css";

export function HostingGamePage(): JSX.Element {
  usePageTitle("Game Hosting");

  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const [gameControllerSocket] = useState(() => gameControllerInstance.getSocketService());
  const location = useLocation();
  const { data } = location.state || {};
  const [roomCode, setRoomCode] = useState<string | null>(null);
  const socketFlag = useRef(false);

  const handleMessage = (payload: any) => {
    console.log("Mensaje recibido del socket", payload);
    if (payload.type === "ROOM_CODE") {
      console.log(`Código de sala recibido: ${payload.content}`);
      setRoomCode(payload.content as string);
    }
  };

  useEffect(() => {
    const initGame = async () => {
      gameControllerInstance.init("http://localhost:5000");
      console.log("Promesa terminada");
      if (!socketFlag.current && data?.id) {
        gameControllerInstance.actionController({ type: "CREATE_ROOM", content: data.id });
        socketFlag.current = true;
        console.log(`Mensaje enviado al servidor para iniciar el quiz con ID: ${data.id}`);
      }
    };

    if (data?.id) {
      initGame();
    }
  }, [data?.id, gameControllerInstance]);

 useEffect(() => {
  if (gameControllerSocket) {
    gameControllerSocket.onMessage(handleMessage);
    return () => {
      if (gameControllerSocket.offMessage) {
        gameControllerSocket.offMessage(handleMessage);
      }
    };
  }
}, [data?.id, gameControllerSocket]);

  return (gameControllerInstance &&
    <>
      <div className="hosting-game-container">
        <h1>Bienvenido al Juego</h1>
        <h2>Estás hosteando una sala</h2>
        <p>Nombre del Quiz <strong>{data.title}</strong></p>
        <p>Descripción:{data.description}</p>
        <h2>Código de Sala: {roomCode ?? "Esperando código..."}</h2>
      </div>
    </>
  );
}
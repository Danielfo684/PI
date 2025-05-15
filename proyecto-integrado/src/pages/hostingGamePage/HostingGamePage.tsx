import { JSX, useState, useEffect } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import { useLocation } from "react-router-dom";
import "./HostingGamePage.css";



export function HostingGamePage(): JSX.Element {
  usePageTitle("Game Hosting");

const [gameControllerInstance] = useState(() => GameController.getInstance());
  const location = useLocation();
  const { data } = location.state || {};
  const [roomCode, setRoomCode] = useState<string | null>(null);
  console.log(data);
  
  async () => {
    await gameControllerInstance.init("http://localhost:5000");
    console.log("Promesa terminada");
    gameControllerInstance.actionController({ type: "CREATE_ROOM", content: data.id });
    console.log(`Mensaje enviado al servidor para iniciar el quiz con ID: ${data.id}`);
  }


  const handleMessage = (payload: any) => {
      if (payload.type === "roomCode") {
        console.log(`Código de sala recibido: ${payload.content}`);
        setRoomCode(payload.content as string);
      }
    };

  return (gameControllerInstance &&
    <>
      <div className="hosting-game-container">
        <h1>Bienvenido al Juego</h1>
        <h2>Estás hosteando una sala</h2>
        <p>Nombre del Quiz <strong>{data.title}</strong></p>
        <p>Descripción:{data.description}</p>
        <h2>Código de Sala: {}</h2>
      </div>
    </>
  );
}
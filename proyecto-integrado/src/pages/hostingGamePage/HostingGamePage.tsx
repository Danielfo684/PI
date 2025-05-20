import { JSX, useState, useEffect, useRef, use } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import { useLocation, useNavigate } from "react-router-dom";
import "./HostingGamePage.css";
import { Player } from "../../components/player/Player";

export function HostingGamePage(): JSX.Element | null {
  usePageTitle("Game Hosting");

  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const [gameControllerSocket] = useState(() => gameControllerInstance.getSocketService());
  const [gameInstance] = useState(() => gameControllerInstance.initialized);
  const [gameStarted, setGameStarted] = useState(() => false);
  const location = useLocation();
  const [players, setPlayers] = useState<any[]>([]);
  const { data } = location.state || {};
  const [currentQuestion, setCurrentQuestion] = useState<any>({});
  const [roomCode, setRoomCode] = useState<string | null>(null);
  const socketFlag = useRef(false);
  const navigate = useNavigate();
  const handleMessage = (payload: any) => {
    console.log("Mensaje recibido del socket", payload);
    if (payload.type === "ROOM_CODE") {
      console.log(`Código de sala recibido: ${payload.content}`);
      setRoomCode(payload.content as string);
    }
    if (payload.type === "JOIN_PLAYER") {
      setPlayers(prev => [...prev, payload.content]);
      console.log(`Nuevo jugador unido: ${payload}`);
    }
    if (payload.type === "QUESTION") {
      console.log(`Pregunta recibida: ${payload.content}`);
      setCurrentQuestion(payload.content);
    }
  };

  useEffect(() => { if (!data) { navigate("/host", { replace: true }); } }, [data, navigate]);

  useEffect(() => {
    const initGame = async () => {
      gameControllerInstance.init("http://localhost:5000");
      console.log("Promesa terminada");
      if (!socketFlag.current && data?.id) {
        gameControllerInstance.socketMessage({ type: "CREATE_ROOM", content: data.id });
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

  useEffect(() => {
    if (gameInstance === false || !data) {
      navigate("/host", { replace: true });
    }
  }, [data, gameControllerInstance.initialized, navigate]);

  const startGame = () => {
    if (players.length === 0) {
      alert("No hay jugadores en la sala");
    } else {
      gameControllerInstance.socketMessage({ type: "START_GAME", content: { roomCode } });
      setGameStarted(true);
    }
  }
  return (
    <>
      <div className="hosting-game-container">
        {!gameStarted ? (
          <>
            <h1>Bienvenido al Juego</h1>
            <h2>Estás hosteando una sala</h2>
            <p>Nombre del Quiz <strong>{data.title}</strong></p>
            <p>Descripción:{data.description}</p>
            <h2>Código de Sala: {roomCode ?? "Esperando código..."}</h2>
            <Button
              text="Iniciar Partida"
              onClick={() => startGame()}
              dataset=""
            />
            <h3>Jugadores en la sala:</h3>
            <div>
              {players.map((player, idx) => (
                <Player.PlayerCard
                  key={player.id}
                  id={player.id}
                  name={player.name}
                  className={player.className}
                  iconNumber={player.iconNumber}
                />
              ))}
            </div>
          </>
        ) : currentQuestion ? (
          <div className="question-section">
            <h3>{currentQuestion.text}</h3>
            <ul>
              {currentQuestion.answers?.map((answer: any) => (
                <li key={answer.id}>{answer.text}</li>
              ))}
            </ul>
            <Button
              text="Volver a jugadores"
              onClick={() => setCurrentQuestion(null)}
              dataset=""
            />
          </div>
        ) : (
          <>
            <h3>Jugadores en la sala:</h3>
            <div>
              {players.map((player, idx) => (
                <Player.PlayerCard
                  key={player.id}
                  id={player.id}
                  name={player.name}
                  className={player.className}
                  iconNumber={player.iconNumber}
                />
              ))}
            </div>
          </>
        )}
      </div>
    </>
  )
}
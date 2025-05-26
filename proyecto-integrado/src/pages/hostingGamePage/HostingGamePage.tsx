import { JSX, useState, useEffect, useRef, use } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import { useLocation, useNavigate } from "react-router-dom";
import "./HostingGamePage.css";
import { Player } from "../../components/player/Player";
import { Footer } from "../../components/footer/Footer";


export function HostingGamePage(): JSX.Element | null {
  usePageTitle("Game Hosting");

  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const [gameControllerSocket] = useState(() => gameControllerInstance.getSocketService());
  const [gameInstance] = useState(() => gameControllerInstance.initialized);
  const [gameStarted, setGameStarted] = useState(() => false);
  const location = useLocation();
  const [players, setPlayers] = useState<any[]>([]);
  const { data } = location.state || {};
  const [currentQuestion, setCurrentQuestion] = useState<any>(null);
  const [showPoints, setShowPoints] = useState(false);
  const [roomCode, setRoomCode] = useState<any>(null);
  const socketFlag = useRef(false);
  const navigate = useNavigate();
  const [waitingTime] = useState(5000);
  const roomCodeRef = useRef<any>(null);
  const [timer, setTimer] = useState<number | null>(null);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const [kicked, setKicked] = useState(false);

  const handleKick = (playerId: number) => {
    gameControllerInstance.socketMessage({
      type: "KICK_PLAYER",
      content: { playerId, roomCode }
    });
  };

  // Obtén el id del usuario logueado para saber si es host
  const loggedUserId = Number(localStorage.getItem("userId"));
  const isHost = players.length > 0 && players[0].id === loggedUserId; // Ajusta según tu lógica de host


  if (kicked) {
    return (
      <div className="kicked-message">
        <h2>Has sido expulsado de la sala</h2>
        <button onClick={() => navigate("/")}>Volver al inicio</button>
      </div>
    );
  }

  const handleMessage = (payload: any) => {
    console.log("Mensaje recibido del socket", payload);
    if (payload.type === "ROOM_CODE") {
      console.log(`Código de sala recibido: ${payload.content}`);
      setRoomCode(payload.content);
      roomCodeRef.current = payload.content;
      console.log(`Código de sala: ${payload.content}`);
    }
    if (payload.type === "JOIN_PLAYER") {
      setPlayers(prev => [...prev, payload.content]);
      console.log(`Nuevo jugador unido: ${payload}`);
    }
    if (payload.type === "QUESTION") {
      setCurrentQuestion(payload.content);
      console.log(payload.content);
      setShowPoints(false);
      setTimer(20);
      if (timerRef.current) clearInterval(timerRef.current);
      timerRef.current = setInterval(() => {
        setTimer(prev => (prev !== null ? prev - 1 : null));
      }, 1000);
    }
    if (payload.type === "HIDE_QUESTION") {
      setCurrentQuestion(null);
      setShowPoints(true);
      setTimer(null);
      if (timerRef.current) clearInterval(timerRef.current);
    }
    if (payload.type === "START_GAME") {
      console.log("El juego ha comenzado");
      setGameStarted(true);
      setTimeout(() => {
        gameControllerInstance.socketMessage({ type: "QUESTION", content: { roomCode: roomCodeRef.current } });
      }, waitingTime);
    }
  };

  useEffect(() => {
    if (!gameControllerSocket) return;
    const handleKickMessage = (payload: any) => {
      if (payload.type === "KICKED") {
        setKicked(true);
      }
    };
    gameControllerSocket.onMessage(handleKickMessage);
    return () => {
      if (gameControllerSocket.offMessage) {
        gameControllerSocket.offMessage(handleKickMessage);
      }
    };
  }, [gameControllerSocket]);

  useEffect(() => {
    if (timer === 0) {
      setTimer(null);
      setCurrentQuestion(null);
      setShowPoints(true);
      if (timerRef.current) {
        clearInterval(timerRef.current);
      }
    }
  }, [timer]);

  useEffect(() => {
    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
    };
  }, []);
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
                  iconNumber={player.id}
                  isHost={isHost}
                  onKick={isHost ? handleKick : undefined}
                />
              ))}
            </div>
          </>
        ) : currentQuestion ? (
          <div className="quiz-container">
            <div className="quiz-box">
              {timer !== null && (
                <div className="timer">Tiempo restante: {timer}s</div>
              )}
              <div className="question-mark">?</div>
              <div className="question-text">
                <p>{currentQuestion.question_text}</p>
              </div>
              <div className="options">
                {currentQuestion.answers?.map((answer: any, idx: number) => (
                  <div className="option" key={answer.id || idx}>
                    {String.fromCharCode(65 + idx)}. {answer.answer_text}
                  </div>
                ))}
              </div>
            </div>
          </div>
        ) : showPoints ? (
          <>
            <h3>Puntuación de los jugadores</h3>
            <div>
              {players.map((player, idx) => (
                <Player.PlayerPoints
                  key={player.id}
                  id={player.id}
                  name={player.name}
                  points={player.score}
                  iconNumber={player.id}
                />
              ))}
            </div>
          </>
        ) : (<>
          <h3>¿Preparados?</h3>
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
          <div className="waiting-question-loader">
            <div className="spinner"></div>
            <p>Preparando la primera pregunta...</p>
          </div>
        </>)}
      </div>
      <Footer />
    </>
  )
}
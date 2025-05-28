import { JSX, useState, useEffect, useRef, use } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import { useLocation, useNavigate } from "react-router-dom";
import "./HostingGamePage.css";
import { Player } from "../../components/player/Player";
import { Footer } from "../../components/footer/Footer";
import { QRCodeJoin } from "../../components/qr/QrCodeJoin";
import { utils } from "../../../src/services/utils";

export function HostingGamePage(): JSX.Element | null {
  usePageTitle("Quizify - Hosteando partida");

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
  const [waitingTime] = useState(3000);
  const roomCodeRef = useRef<any>(null);
  const [timer, setTimer] = useState<number | null>(null);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const [endingGame, setEndingGame] = useState(false);
  const [gameEnded, setGameEnded] = useState(false);
  const [topPlayer, setTopPlayer] = useState<any>(null);

  // const [kicked, setKicked] = useState(false);

  // const handleKick = (playerId: number) => {
  //   gameControllerInstance.socketMessage({
  //     type: "KICK_PLAYER",
  //     content: { playerId, roomCode }
  //   });
  // };

  // Obtén el id del usuario logueado para saber si es host
  const loggedUserId = Number(localStorage.getItem("userId"));
  const isHost = players.length > 0 && players[0].id === loggedUserId; // Ajusta según tu lógica de host


  // if (kicked) {
  //   return (
  //     <div className="kicked-message">
  //       <h2>Has sido expulsado de la sala</h2>
  //       <button onClick={() => navigate("/")}>Volver al inicio</button>
  //     </div>
  //   );
  // }

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
      if (payload.content.end) {
        setEndingGame(true);
      }
      setShowPoints(false);
      setTimer(10);
      if (timerRef.current) clearInterval(timerRef.current);
      timerRef.current = setInterval(() => {
        setTimer(prev => (prev !== null ? prev - 1 : null));
      }, 1000);
    }
    if (payload.type === "QUESTION_FINISHED") {
      setTimer(0);

    }
   
    if (payload.type === "START_GAME") {
      console.log("El juego ha comenzado");
      setTimer(10);
      setGameStarted(true);
      setTimeout(() => {
        gameControllerInstance.socketMessage({ type: "QUESTION", content: { roomCode: roomCodeRef.current } });
      }, waitingTime);
    }
    if (payload.type === "PLAYER_LIST") {

      setPlayers(payload.content.players || []);
      if (payload.content.players.length === 0) {
        console.log("No hay jugadores en la sala");
      } else {
        console.log("Lista de jugadores actualizada", payload.content.players);
      }
      setShowPoints(true);

    };
  }

  useEffect(() => {
    if (timer === 0 && roomCode) {
      if (timerRef.current) {
        clearInterval(timerRef.current);
        timerRef.current = null;
      }
      setCurrentQuestion(null);
      setTimer(null);
      gameControllerInstance.socketMessage({
        type: "PLAYER_LIST",
        content: { roomCode }
      });
    }
  }, [timer, roomCode, gameControllerInstance]);

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

  const nextQuestion = () => {
    gameControllerInstance.socketMessage({ type: "QUESTION", content: { roomCode } });
  }

  const endGame = () => {
    gameControllerInstance.socketMessage({ type: "PLAYER_LIST", content: { roomCode } });
    gameControllerInstance.socketMessage({ type: "END_GAME", content: { roomCode } });
    console.log("Partida finalizada");

    setCurrentQuestion(null);
    setShowPoints(true);
    setGameEnded(true); 
    navigate("/host", { replace: true });
  }

  useEffect(() => {
    if (players.length > 0 && !gameEnded) {
      const sortedPlayers = [...players].sort((a, b) => (b.points || 0) - (a.points || 0));
      setTopPlayer(sortedPlayers[0]);
    }
  }, [players, gameEnded]);

  return (
    <>
      <div className="hosting-game-container">
        {gameEnded ? (
          <>
            <h2>¡Partida finalizada!</h2>
            {topPlayer && (
              <div className="winner-section">
                <h3>Ganador/a</h3>
                <Player.PlayerPoints
                  key={topPlayer.id}
                  id={topPlayer.id}
                  name={topPlayer.name}
                  points={topPlayer.points ?? 0}
                  iconNumber={topPlayer.id ?? 1}
                />
              </div>
            )}
            <h3>Puntuación de todos los jugadores</h3>
            <div>
              {players
                .filter(p => !topPlayer || p.id !== topPlayer.id)
                .map((player, idx) => (
                  <Player.PlayerPoints
                    key={player.id}
                    id={player.id}
                    name={player.name}
                    points={player.points ?? 0}
                    iconNumber={player.id ?? 1}
                  />
                ))}
            </div>
           <Button
                text="Finalizar partida"
                onClick={() => endGame()}
                dataset=""
              />
          </>
        ) : !gameStarted ? (
          <>
            <h1>Bienvenido al Juego</h1>
            <h2>Estás hosteando una sala</h2>
            <p>Nombre del Quiz <strong>{data.title}</strong></p>
            <p>Descripción:{data.description}</p>
            <h2>Código de Sala: {roomCode ?? "Esperando código..."}</h2>
            {roomCode && <QRCodeJoin roomCode={roomCode} />}
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
                // onKick={isHost ? handleKick : undefined}
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
              {
                utils.orderByPointsAndId(players).map((player, index) => (
                  <Player.PlayerPoints
                    key={player.id}
                    id={player.id}
                    name={player.name}
                    points={player.points ?? 0}
                    iconNumber={player.id ?? 1}
                    className={
                      index === 0 ? "first-place"
                        : index === 1 ? "second-place"
                          : index === 2 ? "third-place"
                            : ""
                    }
                  />
                ))}
            </div>
            {!endingGame ? (
              <Button
                text="Siguiente pregunta"
                onClick={() => nextQuestion()}
                dataset=""
              />
            ) : (
              <Button
                text="Finalizar partida"
                onClick={() => endGame()}
                dataset=""
              />
            )}
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
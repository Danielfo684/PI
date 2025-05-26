import { JSX, useEffect, useRef, useState } from "react"
import { Card, CardContent, Input, Button, CardSection } from '../../components/basicComponents/index'
import "./gamePage.css"
import { GameController } from "../../services/GameController"
import { Message } from "../../services/SocketService"
import { useLocation } from "react-router-dom"
import { usePageTitle } from "../../hooks/usePageTitle"
import { Player } from "../../components/player/Player";


interface Question {
  id: number;
  title: string;
  description?: string;
  answers: [{ id: number, text?: string, isCorrect: boolean }];
}
interface Player {
  id: number;
  name: string;
  score: number;
}


export function GamePage(): JSX.Element {
  usePageTitle("Game");

  const [players, setPlayers] = useState<Player[]>([]);
  const [myPlayerId, setMyPlayerId] = useState<number | null>(null);

  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const [gameControllerSocket] = useState(() => gameControllerInstance.getSocketService());
  const [currentQuestion, setCurrentQuestion] = useState<any>(null);
  const [showPoints, setShowPoints] = useState(false);
  const [roomCode, setRoomCode] = useState<string | null>(null);
  const location = useLocation();
  const { data } = location.state || {};
  const [timer, setTimer] = useState<number | null>(null);
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    if (data?.id) setMyPlayerId(data.id);
  }, [data?.id]);

  useEffect(() => {
    if (timer === 0) {
      setTimer(null);
    }
  }, [timer]);

  useEffect(() => {
    setRoomCode(data?.roomCode ?? null);
  }, [data?.roomCode]);

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

  const handleMessage = (payload: any) => {
    console.log("Mensaje recibido del socket", payload);

    if (payload.type === "QUESTION") {
      console.log(`Pregunta recibida: ${payload.content}`);
      setCurrentQuestion(payload.content);
      setShowPoints(true);
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
      gameControllerInstance.socketMessage({
        type: "PLAYER_LIST",
        content: { roomCode }
      });
    }

    if (payload.type === "PLAYER_LIST") {
      setPlayers(payload.content.players || []);
    }
  };
  useEffect(() => {
    if (timer === 0) {
      setTimer(null);
      setCurrentQuestion(null);
      setShowPoints(false);
      if (timerRef.current) clearInterval(timerRef.current);
    }
  }, [timer]);


  const sendAnswer = (answer: number) => {
    console.log("Answer clicked:", answer);
    gameControllerInstance.socketMessage({
      type: "ANSWER",
      content: {
        selection: answer,
        playerId: data?.id,
        roomCode: roomCode,
      }
    } as Message);
  }

  return (
    <>
      {currentQuestion ? (
        <div className="quiz-container">
          <div className="quiz-box">
            {timer !== null && (
              <div className="timer">Tiempo restante: {timer}s</div>
            )}
            <div className="question-mark">?</div>
            <div className="question-text">
              <p>{currentQuestion.text}</p>
            </div>
            <div className="options">
              {currentQuestion.answers?.map((answer: any, idx: number) => (
                <div
                  className="option"
                  key={answer.id || idx}
                  onClick={() => sendAnswer(answer.id)}
                  style={{ cursor: "pointer" }}
                >
                  {String.fromCharCode(65 + idx)}. {answer.text}
                </div>
              ))}
            </div>
          </div>
        </div>
      ) : showPoints ? (
        <div>
          <h3>Puntuación de los jugadores</h3>
          <div>
            {players.map((player) => (
              <Player.PlayerPoints
                key={player.id}
                id={player.id}
                name={player.name}
                points={player.score}
                iconNumber={player.id}
                className={player.id === myPlayerId ? "my-player" : ""}
              />
            ))}
          </div>
        </div>
      ) : (
        <Player.PlayerPoints
          name={data?.name ?? "Jugador"}
          points={data?.score ?? 0}
          id={data?.id ?? 0}
          iconNumber={data?.iconNumber ?? 1}
        />
      )}
    </>
  );
}
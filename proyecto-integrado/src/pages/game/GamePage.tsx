import { JSX, useEffect, useRef, useState } from "react"
import { Card, CardContent, Input, Button, CardSection } from '../../components/basicComponents/index'
import "./gamePage.css"
import { GameController } from "../../services/GameController"
import { Message } from "../../services/SocketService"
import { useLocation } from "react-router-dom"
import { usePageTitle } from "../../hooks/usePageTitle"
import { Player } from "../../components/player/Player";
import { utils } from "../../../src/services/utils";


interface Player {
  id: number;
  name: string;
  score: number;
}


export function GamePage(): JSX.Element {
  usePageTitle("Quizify - Partida en curso");

  const [players, setPlayers] = useState<any[]>([]);
  const location = useLocation();
  const [myPlayerId, setMyPlayerId] = useState<number | null>(null);

  const { player, roomCode } = location.state || {};
  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const [gameControllerSocket] = useState(() => gameControllerInstance.getSocketService());
  const [currentQuestion, setCurrentQuestion] = useState<any>(null);
  // const [showPoints, setShowPoints] = useState(false);
  const [answered, setAnswered] = useState(false);
  const { data } = location.state || {};
  const [timer, setTimer] = useState<number | null>(null);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);


  useEffect(() => {
    if (timer === 0) {
      setTimer(null);
    }
  }, [timer]);


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
      setAnswered(false);
      console.log(`Pregunta recibida: ${payload.content}`);
      setCurrentQuestion(payload.content);
      // setShowPoints(true);
      setTimer(10);

      if (timerRef.current) clearInterval(timerRef.current);
      timerRef.current = setInterval(() => {
        setTimer(prev => (prev !== null ? prev - 1 : null));
      }, 1000);
    }

    // if (payload.type === "HIDE_QUESTION") {
    //   setCurrentQuestion(null);
    //   // setShowPoints(true);
    //   console.log("Ocultando pregunta");
    //   setTimer(null);
    //   setPlayers(payload.content.players);

    //   setAnswered(false);
    //   if (timerRef.current) clearInterval(timerRef.current);
    //   gameControllerInstance.socketMessage({
    //     type: "PLAYER_LIST",
    //     content: { roomCode }
    //   });
    // }

    if (payload.type === "PLAYER_LIST") {
      setPlayers(payload.content.players || []);
    }
  };
  useEffect(() => {
    if (timer === 0) {
      setTimer(null);
      setCurrentQuestion(null);
      // setShowPoints(true);
      if (timerRef.current) clearInterval(timerRef.current);
    }
  }, [timer]);


  const sendAnswer = (answer: number) => {
    console.log("Answer clicked:", answer);

    gameControllerInstance.socketMessage({
      type: "ANSWER",
      content: {
        selection: answer,
        playerId: player.id,
        roomCode: roomCode,
      }
    });
    setAnswered(true);
  }

  return (
    <>
      {currentQuestion ? (
        !answered ? (
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
                  <div
                    className="option"
                    key={answer.id || idx}
                    onClick={() => sendAnswer(answer.id)}
                    style={{ cursor: "pointer" }}
                  >
                    {String.fromCharCode(65 + idx)}. {answer.answer_text}
                  </div>
                ))}
              </div>
            </div>
          </div>
        ) : (

          <div className="waiting-question-loader">
            {timer !== null && (
              <>
                <div className="timer">Tiempo restante: {timer}s</div>
                <div className="spinner"></div>
                <div> Esperando a que todos los jugadores respondan...</div>
              </>
            )}
          </div>
        )
      ) : players.length > 0 ? (<div>
        <div>Puntuaciones</div>
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
      </div>) : (
        <div className="waiting-question-loader">
          <div className="spinner"></div>
          <p>Preparando la primera pregunta...</p>
        </div>
      )
      }
    </>
  );
}
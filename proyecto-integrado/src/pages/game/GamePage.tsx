import { JSX, useEffect, useState } from "react"
import { Card, CardContent, Input, Button, CardSection } from '../../components/basicComponents/index'
import "./gamePage.css"
import { GameController } from "../../services/GameController"
import { Message } from "../../services/SocketService"
import { useLocation } from "react-router-dom"
import { usePageTitle } from "../../hooks/usePageTitle"

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
  const [gameControllerInstance] = useState(() => GameController.getInstance());
  const [gameControllerSocket] = useState(() => gameControllerInstance.getSocketService());
  const [currentQuestion, setCurrentQuestion] = useState<any>(null);
  const [showPoints, setShowPoints] = useState(false);
  const [roomCode, setRoomCode] = useState<string | null>(null);
  const location = useLocation();
  const { data } = location.state || {};

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
    }

  };
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
        <div className="game-currentQuestion-container">
          <h2>{currentQuestion.text}</h2>

          <CardSection answers={currentQuestion.answers} handleClick={sendAnswer} />

        </div>
      ) : (<div>Aún no hay pregunta</div>)}
    </>

  )
}
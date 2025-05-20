import { JSX, useState } from "react"
import { Card, CardContent, Input, Button, CardSection } from '../../components/basicComponents/index'
import "./gamePage.css"
import { GameController } from "../../services/GameController"
import { Message } from "../../services/SocketService"

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
  const [question, setQuestion] = useState<Question | null>(null);
  const [players, setPlayers] = useState<Player[]>([]);
  const handleClick = (answer: number) => {
    console.log("Answer clicked:", answer);
    GameController.getInstance().socketMessage({
      type: "ANSWER",
      content: {
        selection: answer,
      }
    } as Message);
  }

  return (

    <>
      {question && (
        <div className="game-question-container">
          <h2>{question?.title}</h2>
          <p>{question?.description}</p>

          <CardSection answers={question.answers} handleClick={handleClick} />

        </div>
      )}
    </>

  )
}
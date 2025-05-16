import { JSX, useState } from "react"
import { Card, CardContent, Input, Button, CardSection } from '../../components/basicComponents/index'
import "./gamePage.css"
import { GameController} from "../../services/GameController"
import { Message } from "../../services/SocketService"

export interface Questions {
  id: number;
  title: string;
  description?: string;
}
export interface Answer {
  id: number;
  text: string;
}
export function GamePage(): JSX.Element {
  let answers: Array<Answer> = [{ id: 1, text: "Respuesta 1" }, { id: 2, text: "Respuesta 2" }, { id: 3, text: "Respuesta 3" }, { id: 4, text: "Respuesta 4" }];
  // Define the handler separately for clarity
  const handleClick = (answer: number) => {
    console.log("Answer clicked:", answer);
    GameController.getInstance().actionController({
      type: "ANSWER",
      content: {
        selection: answer,
      }
    } as Message);
  }
  GameController.getInstance().init("http://localhost:5000");

  return (

    <>
      <CardSection answers={answers} handleClick={handleClick}></CardSection>
    </>
  )
}
import { JSX } from "react";
import { Player } from "../../components/player/Player";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./HomePage.css";

export function HomePage(): JSX.Element {
  usePageTitle("Quizify - Inicio");

  return (
    <>
      <div className="player-section1">
        <div className="player-card-home" key={1}>
          <Player.PlayerCard 
            id={1}
            name={"Alvaro"}
            iconNumber={1}
          />
          <div className="player-info-home">
            <p className="player-points">Puntos: {10}</p>
          </div>
        </div>

        <div className="player-card-home" key={2}>
          <Player.PlayerCard 
            id={2}
            name={"Dani"}
            iconNumber={2}
          />
          <div className="player-info-home">
            <p className="player-points">Puntos: {8}</p>
          </div>
        </div>

        <div className="player-card-home" key={3}>
          <Player.PlayerCard 
            id={3}
            name={"Javi"}
            iconNumber={3}
          />
          <div className="player-info-home">
            <p className="player-points">Puntos: {7}</p>
          </div>
        </div>
      </div>
    </>
  );
}
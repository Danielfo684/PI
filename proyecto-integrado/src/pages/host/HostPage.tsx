import { JSX, useState, useEffect } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import "./HostPage.css";
export function HostPage(): JSX.Element {
  usePageTitle("Host Game");

  const handleClick = () => {
    GameController.getInstance().init("http://localhost:5000");
    // Aquí seleccionamos el test que queremos hostear y lo recogemos por fetch. Con el fetch hecho 
  }
    
  // Simulacion de los datos pero hay que hacerlo bien
  const [tests, setTests] = useState<{ id: string; title: string; description: string }[]>([]);

  useEffect(() => {
    // Fetch al servidor y cogemos los test y partidas del usuario
    //  y sacamos estadi y demas dani 
    setTests([
      { id: "1", title: "Test de Matemáticas", description: "Pon a prueba tus habilidades matemáticas." },
      { id: "2", title: "Quiz de Historia", description: "Descubre cuánto sabes sobre historia." },
      { id: "3", title: "Desafío de Ciencia", description: "Explora conceptos científicos interesantes." },
      { id: "4", title: "Desafío de Química", description: "Prueba tus conocimientos en química." }
    ]);
  }, []);

  return (
    <>
      <h1>Elige el test que deseas hostear</h1>
      <div className="host-actions">
        <Button text="Ver Estadísticas" onClick={() => {}} dataset="host-stats" />
      </div>
      <div className="cards-section">
        {tests.map((test) => (
          <Link key={test.id} to={`/host/${test.id}`}>
            <Card dataset={parseInt(test.id)} onClick={() => {}} className="host-card">
              <CardContent dataset={parseInt(test.id)} />
              <div className="card-text">
                <h2>{test.title}</h2>
                <p>{test.description}</p>
              </div>
            </Card>
        
          </Link>
        ))}
            <Card  dataset={2} onClick={handleClick}>
            </Card>
      </div>
    </>
  );
}
import { JSX, useState, useEffect } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import "./HostPage.css";
export function HostPage(): JSX.Element {
  usePageTitle("Host Game");

 

    const gameController =  GameController.getInstance();
    gameController.init("http://localhost:5000");

  // Simulacion de los datos pero hay que hacerlo bien
  //const [tests, setTests] = useState<{ id: string; title: string; description: string }[]>([]);
  const [tests, setTests] = useState<{ id: string; title: string; description: string }[]>([]);

  /*useEffect(() => {
    // Fetch al servidor y cogemos los test y partidas del usuario
    //  y sacamos estadi y demas dani 


    setTests([
      { id: "1", title: "Test de Matemáticas", description: "Pon a prueba tus habilidades matemáticas." },
      { id: "2", title: "Quiz de Historia", description: "Descubre cuánto sabes sobre historia." },
      { id: "3", title: "Desafío de Ciencia", description: "Explora conceptos científicos interesantes." },
      { id: "4", title: "Desafío de Química", description: "Prueba tus conocimientos en química." }
    ]);
  }, []);*/

  useEffect(() => {
    const fetchTests = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/tests", {
          method: "GET",
          credentials: "include",
        });
        const data = await response.json();
        if (response.ok) {
          setTests(data.tests);
        } else {
          console.error("Error al obtener tests:", data.error);
        }
      } catch (err) {
        console.error("Error de conexión:", err);
      }
    };
    fetchTests();
  }, []);

  return (
    <>
      <h1>Elige el test que deseas hostear</h1>
    
      <div className="cards-section">
        {tests.map((test) => (
          <Link 
            key={test.id}
            to={`/host/${test.id}` }
            state={{ data: test }}>
            <Card dataset={parseInt(test.id)} className="host-card">
              <CardContent dataset={parseInt(test.id)} />
              <div className="card-text">
                <h2>{test.title}</h2>
                <p>{test.description}</p>
              </div>
            </Card>

          </Link>
        ))}

      </div >
    </>
  );
}
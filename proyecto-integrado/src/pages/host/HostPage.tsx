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

  //const [tests, setTests] = useState<{ id: string; title: string; description: string }[]>([]);
  const [tests, setTests] = useState<{ id: number; title: string; description: string; is_public: boolean }[]>([]);
  const [publicPage, setPublicPage] = useState<number>(1);
  const [privatePage, setPrivatePage] = useState<number>(1);
  const [itemsPerPage, setItemsPerPage] = useState<number>(10);


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

  // Filtrar tests públicos y privados
  const publicTests = tests.filter(t => t.is_public);
  const privateTests = tests.filter(t => !t.is_public);

  // Función de paginación
  const paginate = (items: any[], currentPage: number, perPage: number) => {
    const startIndex = (currentPage - 1) * perPage;
    return items.slice(startIndex, startIndex + perPage);
  };

  const publicTestsPage = paginate(publicTests, publicPage, itemsPerPage);
  const privateTestsPage = paginate(privateTests, privatePage, itemsPerPage);

  const totalPublicPages = Math.ceil(publicTests.length / itemsPerPage);
  const totalPrivatePages = Math.ceil(privateTests.length / itemsPerPage);


  return (
    <div className="host-page-container">
      <h1>Elige el test que deseas hostear</h1>
      
      <div className="pagination-settings">
        <label htmlFor="itemsPerPage">Tests por página: </label>
        <select
          id="itemsPerPage"
          value={itemsPerPage}
          onChange={(e) => {
            setItemsPerPage(Number(e.target.value));
            // Reiniciamos la paginación al cambiar cantidad
            setPublicPage(1);
            setPrivatePage(1);
          }}
        >
          <option value={5}>5</option>
          <option value={10}>10</option>
          <option value={20}>20</option>
        </select>
      </div>

      <section className="tests-section">
        <h2>Tests Públicos</h2>
        <div className="cards-section">
          {publicTestsPage.map((test) => (
            <Link key={test.id} to={`/host/${test.id}`} state={{ data: test }}>
              <Card className="host-card" dataset={test.id}>
                <CardContent dataset={test.id} />
                <div className="card-text">
                  <h2>{test.title}</h2>
                  <p>{test.description}</p>
                </div>
              </Card>
            </Link>
          ))}
          {publicTestsPage.length === 0 && <p className="no-tests">No hay tests públicos disponibles.</p>}
        </div>
        <div className="pagination">
          <button disabled={publicPage === 1} onClick={() => setPublicPage(publicPage - 1)}>
            Anterior
          </button>
          <span>
            Página {publicPage} de {totalPublicPages || 1}
          </span>
          <button disabled={publicPage === totalPublicPages || totalPublicPages === 0} onClick={() => setPublicPage(publicPage + 1)}>
            Siguiente
          </button>
        </div>
      </section>

      <section className="tests-section">
        <h2>Tests Privados</h2>
        <div className="cards-section">
          {privateTestsPage.map((test) => (
            <Link key={test.id} to={`/host/${test.id}`} state={{ data: test }}>
              <Card className="host-card" dataset={test.id}>
                <CardContent dataset={test.id} />
                <div className="card-text">
                  <h2>{test.title}</h2>
                  <p>{test.description}</p>
                </div>
              </Card>
            </Link>
          ))}
          {privateTestsPage.length === 0 && <p className="no-tests">No hay tests privados para ti.</p>}
        </div>
        <div className="pagination">
          <button disabled={privatePage === 1} onClick={() => setPrivatePage(privatePage - 1)}>
            Anterior
          </button>
          <span>
            Página {privatePage} de {totalPrivatePages || 1}
          </span>
          <button disabled={privatePage === totalPrivatePages || totalPrivatePages === 0} onClick={() => setPrivatePage(privatePage + 1)}>
            Siguiente
          </button>
        </div>
      </section>
    </div>
  );
}
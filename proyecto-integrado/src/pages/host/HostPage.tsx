import { JSX, useState, useEffect } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link, useNavigate } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import "./HostPage.css";
import { Footer } from "../../components/footer/Footer";
import { Floating } from "../../components/floatingButton/floatingButton";

export function HostPage(): JSX.Element {
  usePageTitle("Quizify - Organizar partida");

  const navigate = useNavigate();
  const gameController = GameController.getInstance();
  gameController.init("http://localhost:5000");

  const [tests, setTests] = useState<{ id: number; title: string; description: string; is_public: boolean; user_id?: number }[]>([]);
  const itemsPerPage = 8;
  const [publicPage, setPublicPage] = useState<number>(1);
  const [privatePage, setPrivatePage] = useState<number>(1);

  const [publicSearch, setPublicSearch] = useState<string>("");
  const [privateSearch, setPrivateSearch] = useState<string>("");

  const loggedUserId = Number(localStorage.getItem("userId"));

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
  

  // After fetching tests and creating publicTests and privateTests arrays:
  const publicTests = tests.filter(t => t.is_public);
  const privateTests = tests.filter(t => !t.is_public);

  // Apply filter with the searches:
  const filteredPublicTests = publicTests.filter(t =>
    t.title.toLowerCase().includes(publicSearch.toLowerCase()) ||
    t.description.toLowerCase().includes(publicSearch.toLowerCase())
  );
  const filteredPrivateTests = privateTests.filter(t =>
    t.title.toLowerCase().includes(privateSearch.toLowerCase()) ||
    t.description.toLowerCase().includes(privateSearch.toLowerCase())
  );

  // Paginate the filtered arrays instead of the full arrays:
  const paginate = (items: any[], currentPage: number, perPage: number) => {
    const startIndex = (currentPage - 1) * perPage;
    return items.slice(startIndex, startIndex + perPage);
  };

  const publicTestsPage = paginate(filteredPublicTests, publicPage, itemsPerPage);
  const privateTestsPage = paginate(filteredPrivateTests, privatePage, itemsPerPage);

  // Calculate total pages based on filtered arrays:
  const totalPublicPages = Math.ceil(filteredPublicTests.length / itemsPerPage);
  const totalPrivatePages = Math.ceil(filteredPrivateTests.length / itemsPerPage);


  const handleEdit = (test: any) => {
    navigate(`/edit-test/${test.id}`, { state: { testData: test } });
    console.log("Editar test", test.id);
  };

  const handleDelete = async (testId: number) => {
    if (!window.confirm("¿Estás seguro de eliminar este test?")) return;
    try {
      const response = await fetch(`http://localhost:5000/api/tests/${testId}`, {
        method: "DELETE",
        credentials: "include",
      });
      const data = await response.json();
      if (response.ok) {
        setTests(tests.filter((t) => t.id !== testId));
        alert("Test eliminado correctamente");
      } else {
        alert(data.error);
      }
    } catch (err) {
      console.error("Error al eliminar test:", err);
    }
  };

  
  return (
    <>
      <div id="top"></div>
      <Floating target="#top" />
      <div className="host-page-container">
        <h2>Organiza tu propia partida</h2>
        
        {/* Section for Private Tests */}
        <section className="tests-section">
          <h2>Tests Privados</h2>
          <input 
            type="text" 
            className="search-input" 
            placeholder="Buscar tests privados" 
            value={privateSearch}
            onChange={(e) => {
              setPrivateSearch(e.target.value);
              setPrivatePage(1);
            }}
          />
          <div className="cards-section">
            {privateTestsPage.map((test) => (
              <div key={test.id} className="test-card-container">
                <Link to={`/host/${test.id}`} state={{ data: test }}>
                  <Card className="host-card" dataset={test.id}>
                    <CardContent dataset={test.id} />
                    <div className="card-text">
                      <h2>{test.title}</h2>
                      <p>{test.description}</p>
                    </div>
                  </Card>
                </Link>
              </div>
            ))}
            {privateTestsPage.length === 0 && <p className="no-tests">No tienes ningun test privado.</p>}
          </div>
          {totalPrivatePages > 1 && (
            <div className="pagination">
              {privatePage > 1 && (
                <button onClick={() => setPrivatePage(privatePage - 1)}>
                  Anterior
                </button>
              )}
              <span>
                Página {privatePage} de {totalPrivatePages}
              </span>
              {privatePage < totalPrivatePages && (
                <button onClick={() => setPrivatePage(privatePage + 1)}>
                  Siguiente
                </button>
              )}
            </div>
          )}
        </section>

        {/* Section for Public Tests */}
        <section className="tests-section">
          <h2>Tests Públicos</h2>
          <input 
            type="text" 
            className="search-input" 
            placeholder="Buscar tests públicos" 
            value={publicSearch}
            onChange={(e) => {
              setPublicSearch(e.target.value);
              setPublicPage(1);
            }}
          />
          <div className="cards-section">
            {publicTestsPage.map((test) => (
              <div key={test.id} className="test-card-container">
                <Link to={`/host/${test.id}`} state={{ data: test }}>
                  <Card className="host-card" dataset={test.id}>
                    <CardContent dataset={test.id} />
                    <div className="card-text">
                      <h2>{test.title}</h2>
                      <p>{test.description}</p>
                    </div>
                  </Card>
                </Link>
                {test.user_id === loggedUserId && (
                  <div className="action-buttons">
                    <button onClick={() => navigate(`/view-test/${test.id}`)}>Visualizar</button>
                    <button onClick={() => handleEdit(test)}>Editar</button>
                    <button onClick={() => handleDelete(test.id)}>Borrar</button>
                  </div>
                )}
              </div>
            ))}
            {publicTestsPage.length === 0 && <p className="no-tests">No hay tests públicos disponibles.</p>}
          </div>
          {totalPublicPages > 1 && (
            <div className="pagination">
              {publicPage > 1 && (
                <>
                  <button onClick={() => setPublicPage(1)}>{"<<"}</button>
                  <button onClick={() => setPublicPage(publicPage - 1)}>{"<"}</button>
                </>
              )}
              <span>
                Página {publicPage} de {totalPublicPages}
              </span>
              {publicPage < totalPublicPages && (
                <>
                  <button onClick={() => setPublicPage(publicPage + 1)}>{">"}</button>
                  <button onClick={() => setPublicPage(totalPublicPages)}>{">>"}</button>
                </>
              )}
            </div>
          )}
        </section>
      </div>
      <Footer />
    </>
  );
}
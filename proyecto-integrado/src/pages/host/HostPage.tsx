import { JSX, useState, useEffect } from "react";
import { Card, CardContent, Button } from "../../components/basicComponents/index";
import { Link, useNavigate } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import { GameController } from "../../services/GameController";
import "./HostPage.css";
import { Footer } from "../../components/footer/Footer";


export function HostPage(): JSX.Element {
  usePageTitle("Host Game");

    const navigate = useNavigate();

    const gameController =  GameController.getInstance();
    gameController.init("http://localhost:5000");

  //const [tests, setTests] = useState<{ id: string; title: string; description: string }[]>([]);
  const [tests, setTests] = useState<{ id: number; title: string; description: string; is_public: boolean }[]>([]);
  const [publicPage, setPublicPage] = useState<number>(1);
  const [privatePage, setPrivatePage] = useState<number>(1);
  const [itemsPerPage, setItemsPerPage] = useState<number>(10);

  // Obtén el id del usuario logueado
  const loggedUserId = Number(localStorage.getItem("userId"));
  console.log("loggedUserId:", loggedUserId);

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


  // Funciones para editar y borrar
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
    <div className="host-page-container">
      <h1>Elige el test que deseas hostear</h1>

      <div className="pagination-settings">
        <label htmlFor="itemsPerPage">Tests por página: </label>
        <select
          id="itemsPerPage"
          value={itemsPerPage}
          onChange={(e) => {
            setItemsPerPage(Number(e.target.value));
            setPublicPage(1);
            setPrivatePage(1);
          }}
        >
          <option value={5}>5</option>
          <option value={10}>10</option>
          <option value={20}>20</option>
          <option value={50}>50</option>
        </select>
      </div>

      <section className="tests-section">
        <h2>Tests Públicos</h2>
        <div className="cards-section">
          {publicTestsPage.map((test) => {
            //console.log("Test user_id:", test.user_id);
            return (
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
                <div className="action-buttons">
                  {/* El botón "Visualizar" se muestra para todos, ya que es un test público */}
                  <button onClick={() => navigate(`/view-test/${test.id}`)}>
                    Visualizar
                  </button>
                  {/* Si el usuario es el creador, además se muestran Editar y Borrar */}
                  {test.user_id === loggedUserId && (
                    <>
                      <button onClick={() => handleEdit(test)}>Editar</button>
                      <button onClick={() => handleDelete(test.id)}>Borrar</button>
                    </>
                  )}
                </div>
              </div>
            );
          })}
          {publicTestsPage.length === 0 && <p className="no-tests">No hay tests públicos disponibles.</p>}
        </div>
        <div className="pagination">
          <button disabled={publicPage === 1} onClick={() => setPublicPage(publicPage - 1)}>
            Anterior
          </button>
          <span>
            Página {publicPage} de {totalPublicPages || 1}
          </span>
          <button
            disabled={publicPage === totalPublicPages || totalPublicPages === 0}
            onClick={() => setPublicPage(publicPage + 1)}
          >
            Siguiente
          </button>
        </div>
      </section>

      <section className="tests-section">
        <h2>Tests Privados</h2>
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
              {test.user_id === loggedUserId && (
                <div className="action-buttons">
                  <button onClick={() => navigate(`/view-test/${test.id}`)}>
                    Visualizar
                  </button>
                  <button onClick={() => handleEdit(test)}>Editar</button>
                  <button onClick={() => handleDelete(test.id)}>Borrar</button>
                </div>
              )}
            </div>
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
          <button
            disabled={privatePage === totalPrivatePages || totalPrivatePages === 0}
            onClick={() => setPrivatePage(privatePage + 1)}
          >
            Siguiente
          </button>
        </div>
      </section>
    </div>
  
    
  );

  <>
        <Footer />
    </>
}
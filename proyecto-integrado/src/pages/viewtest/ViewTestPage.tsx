import { JSX, useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Button } from "../../components/basicComponents";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./ViewTestPage.css";

export function ViewTestPage(): JSX.Element {
  usePageTitle("Ver Test");
  const { id } = useParams<{ id: string }>();
  const [test, setTest] = useState<any>(null);
  const [error, setError] = useState<string>("");
  const navigate = useNavigate();
  const loggedUserId = Number(localStorage.getItem("userId"));

  useEffect(() => {
    if (id) {
      fetch(`http://localhost:5000/api/tests/${id}`, {
        method: "GET",
        credentials: "include",
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.test) {
            // Si el test es privado, solo el creador puede verlo
            if (!data.test.is_public && data.test.user_id !== loggedUserId) {
              setError("No estás autorizado para ver este test privado");
            } else {
              setTest(data.test);
            }
          } else {
            setError("Test no encontrado");
          }
        })
        .catch((err) => {
          console.error(err);
          setError("Error de conexión con el servidor");
        });
    }
  }, [id, loggedUserId]);

  if (error) {
    return (
      <div className="view-test-container">
        <h1>Error</h1>
        <p>{error}</p>
        <Button
          text="Volver"
          onClick={() => navigate("/host")}
          dataset="back-view"
        />
      </div>
    );
  }

  if (!test) {
    return <div className="view-test-container">Cargando...</div>;
  }

  // Función que renderiza las respuestas según el usuario
  const renderAnswers = (answers: any[]) => {
    return (
        <ul>
        {answers.map((a, idx) => (
            <li key={idx}>
            {a.answer_text}
            {test.user_id === loggedUserId && a.is_correct ? " (Correcta)" : ""}
            </li>
        ))}
        </ul>
    );
    };

  return (
    <div className="view-test-container">
      <h1>{test.title}</h1>
      <p>{test.description}</p>
      <div className="questions">
        {test.questions.map((q: any, index: number) => (
          <div key={index} className="question">
            <h3>{`Pregunta ${index + 1}: ${q.question_text}`}</h3>
            {renderAnswers(q.answers)}
          </div>
        ))}
      </div>
      <Button
        text="Volver"
        onClick={() => navigate("/host")}
        dataset="back-view"
      />
    </div>
  );
}
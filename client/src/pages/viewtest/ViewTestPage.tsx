import { JSX, useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Button } from "../../components/basicComponents";
import { usePageTitle } from "../../hooks/usePageTitle";
import "../create/CreateTestPage.css";
import { Footer } from "../../components/footer/Footer";
import { Floating } from "../../components/floatingButton/floatingButton";

export function ViewTestPage(): JSX.Element {
  usePageTitle("Quizify - Test");
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const loggedUserId = Number(localStorage.getItem("userId"));

  const [test, setTest] = useState<any>(null);
  const [error, setError] = useState<string>("");

  useEffect(() => {
    if (id) {
      fetch(`http://proyectointegrado.hopto.org:5000/api/tests/${id}`, {
        method: "GET",
        credentials: "include",
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.test) {
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
      <div className="create-test-container">
        <h2 className="create-title">Error</h2>
        <p className="error">{error}</p>
        <Button text="Volver" onClick={() => navigate("/host")} dataset="back-view" />
        <Footer />
      </div>
    );
  }

  if (!test) {
    return (
      <div className="create-test-container">
        <h2 className="create-title">Cargando test...</h2>
      </div>
    );
  }

  const renderAnswers = (answers: any[]) => (
    <ul>
      {answers.map((a, idx) => (
        <li key={idx}>
          {a.answer_text}
          {test.user_id === loggedUserId && a.is_correct ? " (Correcta)" : ""}
        </li>
      ))}
    </ul>
  );

  return (
    <>
      <div id="top"></div>
      <Floating target="#top" />
      <div className="create-test-container">
        <h2 className="create-title">{test.title}</h2>
        <p>{test.description}</p>
        <div className="questions-container">
          {test.questions.map((q: any, index: number) => (
            <div key={index} className="question2">
              <h3>{`Pregunta ${index + 1}`}</h3>
              <p>{q.question_text}</p>
              {renderAnswers(q.answers)}
            </div>
          ))}
        </div>
      </div>
      <Button text="Volver" onClick={() => navigate("/host")} dataset="back-view" />
      <Footer />
    </>
  );
}
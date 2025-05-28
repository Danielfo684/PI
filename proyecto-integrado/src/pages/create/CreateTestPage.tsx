import { JSX, useState } from "react";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import { useNavigate } from "react-router-dom";
import "./CreateTestPage.css";
import { Footer } from "../../components/footer/Footer";
import { Floating } from "../../components/floatingButton/floatingButton";

export function CreateTestPage(): JSX.Element {
  usePageTitle("Quizify - Crear test");

  const navigate = useNavigate();
  const [error, setError] = useState<string>("");
  const [title, setTitle] = useState<string>("");
  const [description, setDescription] = useState<string>("");
  const [isPublic, setIsPublic] = useState<boolean>(false);
  const [questions, setQuestions] = useState<
    { questionText: string; answers: { answerText: string; isCorrect: boolean }[] }[]
  >([{ questionText: "", answers: [{ answerText: "", isCorrect: false }] }]);

  const addQuestion = (): void => {
    setQuestions([
      ...questions,
      { questionText: "", answers: [{ answerText: "", isCorrect: false }] },
    ]);
  };

  const removeQuestion = (qIndex: number): void => {
    if (questions.length > 1) {
      const newQuestions = questions.filter((_, i) => i !== qIndex);
      setQuestions(newQuestions);
    }
  };

  const updateQuestionText = (qIndex: number, value: string): void => {
    const newQuestions = questions.map((q, i) =>
      i === qIndex ? { ...q, questionText: value } : q
    );
    setQuestions(newQuestions);
  };

  const addAnswerToQuestion = (qIndex: number): void => {
    const newQuestions = questions.map((q, i) => {
      if (i === qIndex) {
        if (q.answers.length < 4) {
          return { ...q, answers: [...q.answers, { answerText: "", isCorrect: false }] };
        } else {
          return q;
        }
      }
      return q;
    });
    setQuestions(newQuestions);
  };

  const removeLastAnswerFromQuestion = (qIndex: number): void => {
    const newQuestions = questions.map((q, i) => {
      if (i === qIndex) {
        if (q.answers.length > 1) {
          return { ...q, answers: q.answers.slice(0, -1) };
        } else {
          return q;
        }
      }
      return q;
    });
    setQuestions(newQuestions);
  };

  const updateAnswerText = (
    qIndex: number,
    aIndex: number,
    value: string
  ): void => {
    const newQuestions = questions.map((q, i) => {
      if (i === qIndex) {
        const newAnswers = q.answers.map((ans, j) =>
          j === aIndex ? { ...ans, answerText: value } : ans
        );
        return { ...q, answers: newAnswers };
      }
      return q;
    });
    setQuestions(newQuestions);
  };

  const toggleAnswerCorrect = (qIndex: number, aIndex: number): void => {
    const newQuestions = questions.map((q, i) => {
      if (i === qIndex) {
        const isAlreadyCorrect = q.answers[aIndex].isCorrect;
        return {
          ...q,
          answers: q.answers.map((ans, j) =>
            j === aIndex ? { ...ans, isCorrect: !isAlreadyCorrect } : { ...ans, isCorrect: false }
          ),
        };
      }
      return q;
    });
    setQuestions(newQuestions);
  };

  const handleSubmit = async (): Promise<void> => {
    if (!title.trim()) {
      setError("Falta completar el título del test");
      return;
    }
    if (!description.trim()) {
      setError("Falta completar la descripción del test");
      return;
    }
    for (let i = 0; i < questions.length; i++) {
      const q = questions[i];
      if (!q.questionText.trim()) {
        setError(`Falta completar la pregunta ${i + 1}`);
        return;
      }
      if (q.answers.length < 2) {
        setError(`La pregunta ${i + 1} debe tener al menos dos respuestas.`);
        return;
      }
      for (let j = 0; j < q.answers.length; j++) {
        const ans = q.answers[j];
        if (!ans.answerText.trim()) {
          setError(`Falta completar la respuesta ${j + 1} de la pregunta ${i + 1}`);
          return;
        }
      }
      const correctCount = q.answers.filter(ans => ans.isCorrect).length;
      if (correctCount !== 1) {
        setError(`La pregunta ${i + 1} debe tener exactamente una respuesta correcta.`);
        return;
      }
    }
    setError("");

    const testData = { title, description, is_public: isPublic, questions };
    try {
      const response = await fetch("http://localhost:5000/api/tests", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify(testData),
      });
      const data = await response.json();
      if (!response.ok) {
        setError(data.error);
      } else {
        console.log("Test creado:", data);
        window.alert("El test ha sido creado con éxito!");
        navigate("/host", { replace: true });
      }
    } catch (err) {
      setError("Error de conexión con el servidor");
    }
  };

  return (
    <>
      <div id="top"></div>
      <Floating target="#top" />
      <h2 className="create-title">Crear test</h2>
      <p className="page-description">
        En esta <span>página</span> puedes crear tu propio test. Configura el <span>título</span>, 
        la <span>descripción</span> y añade las preguntas con sus respectivas respuestas.
        Por defecto, los test creados serán <span>privados</span>. Si quieres que otros
        usuarios puedan <span>ver y jugar tu test</span>, marca la opción <span>"Hacer público"</span>.
      </p>
      {error && <p className="error-message">{error}</p>}
      <div className="input-test">
        <Input
          placeholder="Nombre del test"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <Input
          placeholder="Descripción breve del test"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
      </div>
      <div className="create-test-container">
        <h2>Preguntas</h2>
        <div className="questions-container">
          {questions.map((q, qIndex) => (
            <div key={qIndex} className="question2">
              <Input
                placeholder="Escribe una pregunta"
                value={q.questionText}
                onChange={(e) => updateQuestionText(qIndex, e.target.value)}
              />
              <div className="answers-container">
                {q.answers.map((ans, aIndex) => (
                  <div key={aIndex} className="answer">
                    <Input
                      placeholder="Escribe una respuesta"
                      value={ans.answerText}
                      onChange={(e) =>
                        updateAnswerText(qIndex, aIndex, e.target.value)
                      }
                    />
                    <label>
                      <input
                        type="checkbox"
                        checked={ans.isCorrect}
                        onChange={() => toggleAnswerCorrect(qIndex, aIndex)}
                      />
                      Correcta
                    </label>
                  </div>
                ))}
                
                  <div className="answer-actions">
                    {q.answers.length < 4 && (
                    <Button
                      text="Añadir respuesta"
                      onClick={() => addAnswerToQuestion(qIndex)}
                      dataset={`add-answer-${qIndex}`}
                    />
                    )}
                    {q.answers.length > 1 && (
                      <Button
                        text="Borrar respuesta"
                        onClick={() => removeLastAnswerFromQuestion(qIndex)}
                        dataset={`delete-answer-${qIndex}`}
                      />
                    )}
                  </div>
              </div>
              <div className="delete-actions1">
                {questions.length > 1 && (
                  <Button
                    text="Borrar pregunta"
                    onClick={() => removeQuestion(qIndex)}
                    dataset={`remove-question-${qIndex}`}
                  />
                )}
              </div>
            </div>
          ))}
        </div>
        <Button text="Añadir pregunta" onClick={addQuestion} dataset="add-question" />
      </div>
      <div className="done-section">
          <div style={{ margin: "1rem 0" }} className="last-lab">
            <label>
              <input
                type="checkbox"
                checked={isPublic}
                onChange={(e) => setIsPublic(e.target.checked)}
              />
              &nbsp;Hacer público
            </label>
          </div>
          <Button text="Crear test" onClick={handleSubmit} dataset="create-test" />
      </div>

      <Footer />
    </>
  );
}
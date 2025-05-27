import { JSX, useState, useEffect } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./EditTestPage.css";
  
export function EditTestPage(): JSX.Element {
  usePageTitle("Quizify - Editar test");
  const navigate = useNavigate();
  const location = useLocation();
  
  const { testData } = location.state as { testData: any } || {};
  if (!testData) {
    return <div>Error: No se encontraron datos del test a editar.</div>;
  }
  
  const [title, setTitle] = useState<string>(testData.title);
  const [description, setDescription] = useState<string>(testData.description);
  const [isPublic, setIsPublic] = useState<boolean>(testData.is_public);
  const [questions, setQuestions] = useState<
    { questionText: string; answers: { answerText: string; isCorrect: boolean }[] }[]
  >(testData.questions || []);
  const [error, setError] = useState<string>("");

    useEffect(() => {
      if (!testData.questions || testData.questions.length === 0) {
        fetch(`http://localhost:5000/api/tests/${testData.id}`, {
          method: "GET",
          credentials: "include",
        })
          .then((response) => response.json())
          .then((data) => {
            console.log("DEBUG: Fetched test data:", data);
            if (data.test) {
              setTitle(data.test.title);
              setDescription(data.test.description);
              setIsPublic(Boolean(data.test.is_public));
              const normalizedQuestions = (data.test.questions || []).map((q: any) => ({
                questionText: q.question_text,
                answers: (q.answers || []).map((a: any) => ({
                  answerText: a.answer_text,
                  isCorrect: Boolean(a.is_correct),
                })),
              }));
              setQuestions(normalizedQuestions);
            } else {
              setError("No se pudo cargar la información completa del test");
            }
          })
          .catch((err) => {
            console.error(err);
            setError("Error de conexión con el servidor");
          });
      }
    }, [testData.id, testData.questions]);

  const updateQuestionText = (qIndex: number, value: string): void => {
    const newQuestions = questions.map((q, i) =>
      i === qIndex ? { ...q, questionText: value } : q
    );
    setQuestions(newQuestions);
  };

  const updateAnswerText = (qIndex: number, aIndex: number, value: string): void => {
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
          )
        };
      }
      return q;
    });
    setQuestions(newQuestions);
  };

  const handleSubmit = async (): Promise<void> => {
    if (!title.trim()) {
      setError("El título no puede estar vacío");
      return;
    }
    if (!description.trim()) {
      setError("La descripción no puede estar vacía");
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
        if (!q.answers[j].answerText.trim()) {
          setError(`Falta la respuesta ${j + 1} en la pregunta ${i + 1}`);
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
  
    const updatedTest = { title, description, is_public: isPublic, questions };
    try {
      const response = await fetch(`http://localhost:5000/api/tests/${testData.id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify(updatedTest),
      });
      const data = await response.json();
      if (!response.ok) {
        setError(data.error);
      } else {
        alert("Test actualizado correctamente");
        navigate("/host", { replace: true });
      }
    } catch (err) {
      setError("Error de conexión con el servidor");
    }
  };

  const addQuestion = (): void => {
    setQuestions([
      ...questions,
      { 
        questionText: "", 
        answers: [
          { answerText: "", isCorrect: false }, 
          { answerText: "", isCorrect: false }
        ]
      }
    ]);
  };

  const removeQuestion = (qIndex: number): void => {
    if (questions.length > 1) {
      const newQuestions = questions.filter((_, index) => index !== qIndex);
      setQuestions(newQuestions);
    }
  };

  const addAnswerToQuestion = (qIndex: number): void => {
    const newQuestions = questions.map((q, i) => {
      if (i === qIndex) {
        if (q.answers.length < 4) {
          return { ...q, answers: [...q.answers, { answerText: "", isCorrect: false }] };
        } else {
          alert("Cada pregunta puede tener máximo 4 respuestas");
          return q;
        }
      }
      return q;
    });
    setQuestions(newQuestions);
  };

  const removeAnswerFromQuestion = (qIndex: number, aIndex: number): void => {
    const newQuestions = questions.map((q, i) => {
      if (i === qIndex && q.answers.length > 2) {
        return { ...q, answers: q.answers.filter((_, index) => index !== aIndex) };
      }
      return q;
    });
    setQuestions(newQuestions);
  };
    
  return (
    <div className="edit-test-container">
      <h1>Editar Test</h1>
      {error && <p className="error-message">{error}</p>}
      <Input placeholder="Título" value={title} onChange={(e) => setTitle(e.target.value)} />
      <Input placeholder="Descripción" value={description} onChange={(e) => setDescription(e.target.value)} />
      <div>
        <label>
          <input type="checkbox" checked={isPublic} onChange={(e) => setIsPublic(e.target.checked)} />
          Hacer test público
        </label>
      </div>
      {questions.map((q, qIndex) => (
        <div key={qIndex} className="question">
          <Input
            placeholder={`Pregunta ${qIndex + 1}`}
            value={q.questionText}
            onChange={(e) => updateQuestionText(qIndex, e.target.value)}
          />
          <div className="answers">
            {q.answers.map((ans, aIndex) => (
              <div key={aIndex} className="answer">
                <Input
                  placeholder={`Respuesta ${aIndex + 1}`}
                  value={ans.answerText}
                  onChange={(e) => updateAnswerText(qIndex, aIndex, e.target.value)}
                />
                <label>
                  <input
                    type="checkbox"
                    checked={ans.isCorrect}
                    onChange={() => toggleAnswerCorrect(qIndex, aIndex)}
                  />
                  Correcta
                </label>
                {q.answers.length > 2 && (
                  <Button
                    text="Eliminar Respuesta"
                    onClick={() => removeAnswerFromQuestion(qIndex, aIndex)}
                    dataset={`remove-answer-${qIndex}-${aIndex}`}
                  />
                )}
              </div>
            ))}
          </div>
          <div className="answer-actions">
            <Button
              text="Agregar Respuesta"
              onClick={() => addAnswerToQuestion(qIndex)}
              dataset={`add-answer-${qIndex}`}
            />
          </div>
          {questions.length > 1 && (
            <Button
              text="Eliminar Pregunta"
              onClick={() => removeQuestion(qIndex)}
              dataset={`remove-question-${qIndex}`}
            />
          )}
        </div>
      ))}
      <Button text="Agregar Pregunta" onClick={addQuestion} dataset="add-question" />
      <Button text="Guardar Cambios" onClick={handleSubmit} dataset="edit-test" />
      <Button text="Cancelar" onClick={() => navigate("/host")} dataset="cancel-edit" />
  </div>
  );
}
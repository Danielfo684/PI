import { JSX, useState } from "react";
import { Input, Button } from "../../components/basicComponents/index";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./CreateTestPage.css";

export function CreateTestPage(): JSX.Element {
  usePageTitle("Create Test");

  const [error, setError] = useState<string>("");
  const [title, setTitle] = useState<string>("");
  const [description, setDescription] = useState<string>("");
  const [questions, setQuestions] = useState<
    { questionText: string; answers: { answerText: string; isCorrect: boolean }[] }[]
  >([]);

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
    const newQuestions = questions.map((q, i) =>
      i === qIndex
        ? { ...q, answers: [...q.answers, { answerText: "", isCorrect: false }] }
        : q
    );
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
        const newAnswers = q.answers.map((ans, j) =>
          j === aIndex ? { ...ans, isCorrect: !ans.isCorrect } : ans
        );
        return { ...q, answers: newAnswers };
      }
      return q;
    });
    setQuestions(newQuestions);
  };

    const handleSubmit = async (): Promise<void> => {
    const testData = { title, description, questions };
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
        // Puedes redirigir, limpiar el formulario, o mostrar un mensaje de éxito
        // Ejemplo: setTitle(""); setDescription(""); setQuestions([]);
      }
    } catch (err) {
      setError("Error de conexión con el servidor");
    }
  };

  return (
    <>
      <h1>Create Test</h1>
      <p className="page-description">
        En esta página puedes crear tu propio test. Configura el título, la descripción y añade las preguntas con sus respectivas respuestas.
      </p>
      <p className="page-description">
       ¡Empieza a construir tu test y compártelo con otros!
      </p>
      <div className="create-test-container">
        <Input
          placeholder="Test Title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <Input
          placeholder="Test Description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />

        <h2>Questions</h2>
        <div className="questions-container">
          {questions.map((q, qIndex) => (
            <div key={qIndex} className="question">
              <Input
                placeholder="Enter your question"
                value={q.questionText}
                onChange={(e) => updateQuestionText(qIndex, e.target.value)}
              />
              <div className="answers-container">
                {q.answers.map((ans, aIndex) => (
                  <div key={aIndex} className="answer">
                    <Input
                      placeholder="Enter an answer"
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
                      Correct
                    </label>
                  </div>
                ))}
                <Button
                  text="Add Answer"
                  onClick={() => addAnswerToQuestion(qIndex)}
                  dataset={`add-answer-${qIndex}`}
                />
              </div>
              {questions.length > 1 && (
                <Button
                  text="Remove Question"
                  onClick={() => removeQuestion(qIndex)}
                  dataset={`remove-question-${qIndex}`}
                />
              )}
            </div>
          ))}
        </div>
        <Button text="Add Question" onClick={addQuestion} dataset="add-question" />
        <Button text="Create Test" onClick={handleSubmit} dataset="create-test" />
      </div>
    </>
  );
}
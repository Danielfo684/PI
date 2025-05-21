import React, { useEffect, useState } from 'react';
import './pregunta.css';

const Quiz: React.FC = () => {
  const [timeLeft, setTimeLeft] = useState(60);

  useEffect(() => {
    if (timeLeft === 0) return;
    const timer = setInterval(() => {
      setTimeLeft(prev => prev - 1);
    }, 1000);

    return () => clearInterval(timer);
  }, [timeLeft]);

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs < 10 ? '0' : ''}${secs}`;
  };

  return (
    <div className="quiz-container">
      <div className="quiz-box">
        <div className="timer">Time left: {formatTime(timeLeft)}</div>
        <div className="question-mark">?</div>
        <div className="question-text">
          <p>What is the capital of France?</p>
        </div>
        <div className="options">
          <div className="option">A. Berlin</div>
          <div className="option">B. Madrid</div>
          <div className="option">C. Paris</div>
          <div className="option">D. Rome</div>
        </div>
      </div>
    </div>
  );
};

export default Quiz;
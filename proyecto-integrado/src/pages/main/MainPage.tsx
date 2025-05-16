import { JSX } from "react"
import { Link } from 'react-router-dom';
import { usePageTitle } from "../../hooks/usePageTitle";
import "./MainPage.css";

export function MainPage() : JSX.Element {
  usePageTitle("Quizify");

  return (
    <>
      <h1>Welcome to Quizify</h1>
      <div className="counter">
        <button> <Link to="/join">Join Game</Link>
        </button>
        <button> <Link to="/create">Create test</Link>
        </button>
        <button> <Link to="/host">Host game</Link>
        </button>
      </div>
      <div className ="cards-section">
      </div>
    </>
  )
}
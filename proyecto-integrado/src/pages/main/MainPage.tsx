import { JSX } from "react"
import { Link } from 'react-router-dom';
import { usePageTitle } from "../../hooks/usePageTitle";
import "./MainPage.css";

export function MainPage() : JSX.Element {
  usePageTitle("Quizify");

  return (
    <>
      <div className="hero">
        <header className="header">
          <div className="logo">
            <Link to="/">
              <img src="../src/assets/images/logo.png" alt="Logo" className="logo-icon" />
            </Link>
          </div>
          <nav className="navigation">
            <ul>
              <li><Link to="/">Inicio</Link></li>
              <li> <Link to="/join">Unirse a partida</Link></li>
              <li> <Link to="/create">Crear test</Link></li>
              <li> <Link to="/host">Organizar partida</Link></li>
              <li>
                <Link to="/user">
                  <img src="../src/assets/images/user.png" alt="User Sign In" className="user-icon" />
                </Link>
              </li>
            </ul>
          </nav>
        </header>
        <h1>Bienvenidos a <span>Quizify</span></h1>
        <div className="intro-hero">
          — Aprender nunca fue tan divertido
        </div>
      </div>
      <div className="about-us">
        <div className="about-text">
          <h2>¿Qué es Quizify?</h2>
          <p>
            Quizify es una plataforma de aprendizaje interactivo que permite a los usuarios crear, compartir y 
            jugar cuestionarios en línea. Con una interfaz intuitiva y una amplia variedad de temas, Quizify hace 
            que el aprendizaje sea divertido y accesible para todos. Ya sea que estés estudiando para un examen o 
            simplemente quieras poner a prueba tus conocimientos, Quizify es la herramienta perfecta para ti.
          </p>
        </div>
        <div className="about-img"></div>
      </div>
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
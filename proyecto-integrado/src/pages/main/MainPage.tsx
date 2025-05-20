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
              <img src="../src/assets/images/logo-sinborde.png" alt="Logo" className="logo-icon" />
            </Link>
          </div>
          <nav className="navigation">
            <ul>
              <li><Link to="/">Inicio</Link></li>
              <li> <Link to="/play">Jugar</Link></li>
              <li> <Link to="/join">Unirse a partida</Link></li>
              <li> <Link to="/host">Organizar partida</Link></li>
              <li> <Link to="/create">Crear test</Link></li>
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
          <h2>¿Qué es <span>Quizify</span>?</h2>
          <p>
            Es una plataforma de <span>aprendizaje interactivo</span> que permite a los usuarios <span>crear</span>, <span>compartir</span> y <span>jugar</span> cuestionarios en línea. Con una interfaz intuitiva y una amplia 
            <span>variedad de temas</span>, Quizify hace que el aprendizaje sea <span>divertido</span> y <span>accesible</span> para todos. 
            Ya sea que estés estudiando para un examen o simplemente quieras poner a prueba tus conocimientos, 
            Quizify es la <span>herramienta perfecta</span> para ti.
          </p>
          <button><Link to="/play"><p>¡Empieza ahora!</p></Link></button>
        </div>
        <div className="about-img"></div>
      </div>
      <div className="quote-section">
        <p className="quote">“We learn from failure, not from success”</p><br/>
        <p className="author">— Bram Stoker</p>
      </div>
      <div className="play-section">
        <h2>¿Cómo jugar?</h2>
        <div className="cards-container">
          <div className="flip-card blue">
            <div className="flip-card-inner">
              <div className="flip-card-front">
                <h3>Unirse a partida</h3>
              </div>
              <div className="flip-card-back">
                <p>Conéctate a una partida ya creada para jugar en tiempo real con otros usuarios.</p>
              </div>
            </div>
          </div>

          <div className="flip-card orange">
            <div className="flip-card-inner">
              <div className="flip-card-front">
                <h3>Organizar partida</h3>
              </div>
              <div className="flip-card-back">
                <p>Crea y configura tu propia partida, invita amigos y empieza a jugar.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className ="cards-section">
      </div>
    </>
  )
}
import { JSX } from "react"
import { Link } from 'react-router-dom';
import { usePageTitle } from "../../hooks/usePageTitle";
import "./PlayPage.css";
import { Footer } from "../../components/footer/Footer";

export function PlayPage() : JSX.Element {
  usePageTitle("Quizify - Jugar");
  

  return (
    <>
        <h1>Bienvenidos a <span>Quizify</span></h1>
        <div className="intro-hero">
          — Aprender nunca fue tan divertido
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
          <button></button>
        </div>
        <div className="about-img"></div>
      </div>
      <div className="counter">
        <button> <Link to="/join">Jugar</Link></button>
        <button> <Link to="/create">Create test</Link>
        </button>
        <button> <Link to="/host">Host game</Link>
        </button>
      </div>
      <div className ="cards-section">
      </div>


      <Footer />
    </>
  )
}
import { JSX } from "react"
import { Link } from 'react-router-dom';
import { usePageTitle } from "../../hooks/usePageTitle";
import "./MainPage.css";
import { Footer } from "../../components/footer/Footer";
import { Header } from "../../components/header/Header";
import { Floating } from "../../components/floatingButton/floatingButton";

export function MainPage() : JSX.Element {
  usePageTitle("Quizify");

  return (
    <>
      <div id="top"></div>
      <Floating target="#top" />    
      <div className="hero">
        <Header />
        <h1><span>Quizify</span></h1>
        <div className="intro-hero">
          — Aprender nunca fue tan divertido
        </div>
          <div className="scroll-down">
          <div className="scroll"></div>
        </div>
      </div>

      <div className="about-us">
        <div className="about-text">
          <h2><span>¿Qué es Quizify</span>?</h2>
          <p className="text">
            Es una plataforma de <span>aprendizaje interactivo</span> que permite a los usuarios <span>crear</span>, <span>compartir</span> y <span>jugar</span> cuestionarios en línea. Con una interfaz intuitiva y una amplia <span>variedad de temas</span>, Quizify hace que el aprendizaje sea <span>divertido</span> y <span>accesible</span> para todos. 
            Ya sea que estés estudiando para un examen o simplemente quieras poner a prueba tus conocimientos, 
            Quizify es la <span>herramienta perfecta</span> para ti.
          </p>
          <button><Link to="/play"><p>¡Empieza ahora!</p></Link></button>
        </div>
        <div className="about-img"></div>
      </div>

      <div className="quote-section">
        <div className="quote-img"></div>
        <div className="quote-text">
          <p className="quote">“Aprendemos de los errores, no de los éxitos”</p><br/>
          <p className="author">— Bram Stoker</p>
        </div>
      </div>

      <div className="play-section">
        <h2><span>Modos de juego</span></h2>
        <div className="play-container">
          <Link to="/play"><div className="play play1">
            <div className="play-title">Jugar en solitario</div>
            <div className="play-text">
              <p className="text">
                Pon a prueba tus <span>conocimientos</span> respondiendo preguntas de cualquier <span>categoría</span>.
              </p></div>
          </div></Link>
          <Link to="/join"><div className="play play2">
            <div className="play-title">Unirse a partida</div>
            <div className="play-text">
              <p className="text"><span>
                Conéctate</span> a una partida <span>ya creada</span> mediante un código para jugar en tiempo real con otros <span>jugadores</span>.
              </p></div>
          </div></Link>
          <Link to="/host"><div className="play play">
            <div className="play-title">Organizar partida</div>
            <div className="play-text">
              <p className="text">
                <span>Crea</span> y <span>configura</span> tu propia partida, <span>invita amigos</span> y empieza a jugar con el <span>test</span> que prefieras.
              </p></div>
          </div></Link>
        </div>
      </div>
      

      <Footer />

    </>
  )
}
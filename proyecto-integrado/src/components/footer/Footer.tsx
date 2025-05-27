import { Link } from 'react-router-dom';
import './footer.css';

export function Footer() {
  return (
    <div className="footer">
        <div className="footer-logo">
            <Link to="/">
              <img src="../src/assets/images/logo-sinborde.png" alt="Logo" className="logo-icon2" />
            </Link>
        </div>
        <div className="footer-text">
            <p><span className="brand">© 2025 Quizify</span></p>
            <p><span>Daniel Fontalva Ostio</span> | <span>Álvaro Luque Morillo</span> | <span>Ismael Manzano Reinoso</span> | <span>Francisco Javier Martín Mariscal</span></p>
        </div>
        <div className="agrad">
            <p>Especial agradecimiento: </p>
            <a href="https://www.freepik.es/"><div className="freepik"></div></a>
        </div>
    </div>
  );
}
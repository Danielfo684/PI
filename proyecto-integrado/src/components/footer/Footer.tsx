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
            <p><span>© 2025 Quizify</span></p>
            <p><span>Daniel Fontalva</span>, <span>Álvaro Luque</span>, <span>Ismael Manzano</span>, <span>Francisco Javier Martín</span></p>
        </div>
        <div className="agrad">
            <p>Especial agradecimiento a </p>
            <a href="https://www.freepik.es/"><div className="freepik"></div></a>
        </div>
    </div>
  );
}
import { Link } from 'react-router-dom';
import './Header.css';

export function Header() {
  return (
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
  );
}
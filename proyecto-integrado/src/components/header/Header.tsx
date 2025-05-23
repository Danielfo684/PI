import { Link } from 'react-router-dom';
import { useState } from 'react';
import './header.css';

export function Header() {
  const [menuOpen, setMenuOpen] = useState(false); 

  return (
    <header className="header">
      <div className="logo">
        <Link to="/">
          <img src="/src/assets/images/logo.png" alt="Logo" className="logo-icon" />
        </Link>
      </div>
      <div
        className={`nav-bar${menuOpen ? ' open' : ''}`}
        onClick={() => setMenuOpen(!menuOpen)}
      >
        <span></span>
        <span></span>
        <span></span>
      </div>
      <nav className={`navigation${menuOpen ? ' menu-mobile' : ''}`}>
        <ul>
          <li><Link to="/">Inicio</Link></li>
          <li><Link to="/play">Jugar</Link></li>
          <li><Link to="/join">Unirse a partida</Link></li>
          <li><Link to="/host">Organizar partida</Link></li>
          <li><Link to="/create">Crear test</Link></li>
          <li>
            <Link to={ localStorage.getItem("token") ? "/user" : "/login" }>
              <img src="/src/assets/images/user.png" alt="User Sign In" className="user-icon" />
            </Link>
          </li>
        </ul>
      </nav>
    </header>
  );
}
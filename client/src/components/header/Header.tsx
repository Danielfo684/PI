import { Link } from 'react-router-dom';
import { useState, useEffect } from 'react';
import './header.css';

export function Header() {
  const [menuOpen, setMenuOpen] = useState(false); 

  useEffect(() => {
    if (menuOpen) {
      document.body.classList.add('no-scroll', 'hide-hero');
    } else {
      document.body.classList.remove('no-scroll', 'hide-hero');
    }
    return () => document.body.classList.remove('no-scroll', 'hide-hero');
  }, [menuOpen]);

  return (
    <header className="header">
      <div className="logo">
        <Link to="/">
          <img src="/src/assets/images/logo-sinborde.png" alt="Logo" className="logo-icon" />
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
          <li><Link to="/" onClick={() => setMenuOpen(false)}>Inicio</Link></li>
          <li><Link to="/join" onClick={() => setMenuOpen(false)}>Unirse a partida</Link></li>
          <li><Link to="/host" onClick={() => setMenuOpen(false)}>Organizar partida</Link></li>
          <li><Link to="/create" onClick={() => setMenuOpen(false)}>Crear test</Link></li>
          <li>
            <Link
              to={localStorage.getItem("token") ? "/user" : "/login"}
              onClick={() => setMenuOpen(false)}
            >
              <img src="/src/assets/images/user.png" alt="User Sign In" className="user-icon" />
            </Link>
          </li>
        </ul>
      </nav>
    </header>
  );
}
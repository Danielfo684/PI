import { Link } from 'react-router-dom';
import './Header.css';

export function Header() {
  return (
    <header className="header">
      <div className="logo">
        <Link to="/">Toohak</Link>
      </div>
      <nav className="navigation">
        <ul>
          <li><Link to="/">Home</Link></li>
          <li> <Link to="/join">Join Game</Link></li>
          <li> <Link to="/create">Create test</Link></li>
          <li> <Link to="/host">Host game</Link></li>
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
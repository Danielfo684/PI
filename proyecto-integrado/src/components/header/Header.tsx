import { Link } from 'react-router-dom';
import './Header.css';

export function Header() {
  return (
    <header className="app-header">
      <div className="logo">
        <Link to="/">YourGameName</Link>
      </div>
      <nav className="navigation">
        <ul>
          <li><Link to="/">Home</Link></li>
          <li><Link to="/join">Join Game</Link></li>
          {/* Add more navigation items as needed */}
        </ul>
      </nav>
    </header>
  );
}
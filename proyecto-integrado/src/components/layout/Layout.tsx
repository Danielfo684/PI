import { Outlet, useLocation } from 'react-router-dom';
import { Header } from '../header/Header';
import './layout.css';

export function Layout() {
  const location = useLocation();

  const showHeader = location.pathname !== '/quiz';

  return (
    <div className="app-layout">
      {showHeader && <Header />}
      <main className="main-content">
        <Outlet />
      </main>
    </div>
  );
}
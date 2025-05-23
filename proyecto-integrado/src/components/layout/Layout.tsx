import { Outlet, useLocation } from 'react-router-dom';
import { Header } from '../header/Header';
import { Floating } from '../floatingButton/floatingButton';
import './layout.css';

export function Layout() {
  const location = useLocation();

  const showHeader = location.pathname !== '/quiz';

  return (
    <div className="app-layout">
      <div id="top"></div>
      {showHeader && <Header />}
      <main className="main-content">
        <Outlet />
      </main>
    </div>
  );
}
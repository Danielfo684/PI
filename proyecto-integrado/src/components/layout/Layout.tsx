import { Outlet } from 'react-router-dom';
import { Header } from '../header/Header';
import './Layout.css';

export function Layout() {
  return (
    <div className="app-layout">
      <Header />
      <main className="main-content">
        <Outlet />
      </main>
    </div>
  );
}
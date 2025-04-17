import { JSX } from "react";
import { Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./UserMainPage.css";

export function UserMainPage(): JSX.Element {
  usePageTitle("Dashboard - Toohak");

  return (
    <div className="user-dashboard">
      <h1>Bienvenido a tu Dashboard</h1>
      <p>Esta es tu área personal donde podrás ver tu información, tus resultados y administrar tus tests.</p>
      
      <section className="profile-section">
        <h2>Perfil</h2>
        <div className="profile-details">
          <img src="https://placehold.co/100" alt="Foto de perfil" className="profile-pic" />
          <p><strong>Nombre:</strong> Juan Pérez</p>
          <p><strong>Email:</strong> juan@example.com</p>
          <p><strong>Biografía:</strong> Esta es mi biografía.</p>
          <p><strong>Idioma:</strong> Español</p>
          <p><strong>Notificaciones:</strong> Activadas</p>
          <Link to="/user/settings" className="btn">Editar Perfil</Link>
        </div>
      </section>

      <section className="tests-section">
        <h2>Historial de Tests</h2>
        <ul>
          <li>Test de Matemáticas - 85%</li>
          <li>Quiz de Historia - 90%</li>
          <li>Desafío de Ciencia - 75%</li>
        </ul>
        <Link to="/create" className="btn">Crear Nuevo Test</Link>
      </section>
    </div>
  );
}
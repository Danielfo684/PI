import { JSX, useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./UserMainPage.css";

export function UserMainPage(): JSX.Element {
  usePageTitle("Dashboard - Toohak");
  const navigate = useNavigate();

  // Estado para almacenar los datos del usuario actual
  const [user, setUser] = useState({
    name: "",
    email: "",
    notifications: false,
    photo: "",
  });

  // Se obtienen los datos del usuario desde el endpoint
 /*  useEffect(() => {
    fetch("http://localhost:5000/api/user", { credentials: "include" })
      .then((res) => res.json())
      .then((data) => {
        setUser(data.user);
      })
      .catch((err) => console.error("Error al cargar el usuario:", err));
  }, []); */

  const toggleNotifications = () => {
    // Aquí podrías agregar un llamado a API para actualizar en el backend
    setUser((prev) => ({
      ...prev,
      notifications: !prev.notifications,
    }));
  };

  const handleLogout = async () => {
    try {
      const response = await fetch("http://localhost:5000/logout", {
        method: "POST",
        credentials: "include"
      });
      const data = await response.json();
      console.log("Logout successful", data);
      localStorage.removeItem("token");
      navigate("/login");
    } catch (err) {
      console.error("Error during logout:", err);
    }
  };

  return (
    <div className="user-dashboard">
      <h1>
        Bienvenido a tu Dashboard, {user.name ? user.name : "Usuario"}
      </h1>
      <p>
        Esta es tu área personal donde podrás ver tu información, tus resultados
        y administrar tus tests.
      </p>
      
      <section className="profile-section">
        <h2>Perfil</h2>
        <div className="profile-details">
          <img
            src={user.photo ? user.photo : "https://placehold.co/100"}
            alt="Foto de perfil"
            className="profile-pic"
          />
          <p><strong>Nombre:</strong> {user.name}</p>
          <p><strong>Email:</strong> {user.email}</p>
          <p>
            <strong>Notificaciones:</strong>{" "}
            <button onClick={toggleNotifications} className="btn">
              {user.notifications ? "Desactivar" : "Activar"} notificaciones
            </button>
          </p>
          <Link to="/user/settings" className="btn">
            Editar Perfil
          </Link>
        </div>
      </section>

      <section className="tests-section">
        <h2>Historial de Tests</h2>
        <ul>
          <li>Test de Matemáticas - 85%</li>
          <li>Quiz de Historia - 90%</li>
          <li>Desafío de Ciencia - 75%</li>
        </ul>
      </section>

      {/* Botón de Logout */}
      <div className="logout-container">
        <button onClick={handleLogout} className="btn-logout">
          Logout
        </button>
      </div>
    </div>
  );
}
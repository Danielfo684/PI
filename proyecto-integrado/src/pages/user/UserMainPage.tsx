import { JSX, useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./UserMainPage.css";
import { Footer } from "../../components/footer/Footer";
import { Floating } from "../../components/floatingButton/floatingButton";

export function UserMainPage(): JSX.Element {
  usePageTitle("Dashboard");
  const navigate = useNavigate();

  // Estado para almacenar los datos del usuario actual
  const [user, setUser] = useState<{ name: string; email: string }>({
    name: "",
    email: "",
  });

  // Se obtienen los datos del usuario desde el endpoint
    useEffect(() => {
      const fetchUser = async () => {
        try {
          const res = await fetch("http://localhost:5000/api/user", {
            method: "GET",
            credentials: "include"
          });
          const data = await res.json();
          if (!res.ok) {
            throw new Error(data.error || "Error al obtener usuario");
          }
          setUser(data.user);
        } catch (err) {
          console.error("Error fetching user:", err);
        }
      };
      fetchUser();
    }, [navigate]);

  /* const toggleNotifications = () => {
    setUser((prev) => ({
      ...prev,
      notifications: !prev.notifications,
    }));
  }; */

  const handleLogout = async () => {
    try {
      const response = await fetch("http://localhost:5000/logout", {
        method: "POST",
        credentials: "include",
      });
      await response.json();
      localStorage.removeItem("token");
      navigate("/login", { replace: true });
    } catch (err) {
      console.error("Error during logout:", err);
    }
  };

  return (
    <>
      <div id="top"></div>
      <Floating target="#top" />
      <div className="user-dashboard">
        <h1>
          Bienvenido a tu Dashboard, {user.name || "Usuario"}
        </h1>
        <p>
          Esta es tu área personal donde podrás ver tu información, tus resultados
          y administrar tus tests.
        </p>

        <section className="profile-section">
          <h2>Perfil</h2>
          <div className="profile-details">
            {/* <img
              src={user.photo || "https://placehold.co/100"}
              alt="Foto de perfil"
              className="profile-pic"
            /> */}
            <p><strong>Nombre:</strong> {user.name}</p>
            <p><strong>Email:</strong> {user.email}</p>
            {/* <p>
              <strong>Notificaciones:</strong>{" "}
              <button onClick={toggleNotifications} className="btn">
                {user.notifications ? "Desactivar" : "Activar"} notificaciones
              </button>
            </p> */}
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

        <div className="logout-container">
          <button onClick={handleLogout} className="btn-logout">
            Logout
          </button>
        </div>
      </div>
      <Footer />
    </>
  );
}
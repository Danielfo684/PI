import { JSX, useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./UserMainPage.css";
import { Footer } from "../../components/footer/Footer";
import { Floating } from "../../components/floatingButton/floatingButton";

export function UserMainPage(): JSX.Element {
  usePageTitle("Quizify - Perfil de Usuario");
  const navigate = useNavigate();

  const [user, setUser] = useState<{ name: string; email: string }>({
    name: "",
    email: "",
  });

  const tests = [
    { name: "Test de Matemáticas", score: 85 },
    { name: "Quiz de Historia", score: 90 },
    { name: "Desafío de Ciencia", score: 75 },
  ];

  const testsPerPage = 2;
  const [currentPage, setCurrentPage] = useState(1);
  const totalPages = Math.ceil(tests.length / testsPerPage);
  const currentTests = tests.slice(
    (currentPage - 1) * testsPerPage,
    currentPage * testsPerPage
  );

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

  const handlePageChange = (page: number) => {
    if (page >= 1 && page <= totalPages) {
      setCurrentPage(page);
    }
  };

  return (
    <>
      <div id="top"></div>
      <Floating target="#top" />
      <div className="user-dashboard">
        <h2>Bienvenido a tu perfil, {user.name || "Usuario"}</h2>
        <p>
          Esta es tu área personal donde podrás ver tu información.
        </p>
        <div className="user-container1">
          <section className="profile-section">
            <h2>Perfil</h2>
            <div className="profile-details">
              <p><strong>Nombre:</strong> {user.name}</p>
              <p><strong>Email:</strong> {user.email}</p>
            </div>
            <div className="user-profile-buttons">
              <Link to="/user/settings" className="btn">
                <button>Editar Perfil</button>
              </Link>
              <button onClick={handleLogout} className="btn-logout">
                Cerrar sesión
              </button>
            </div>
          </section>
        </div>
      </div>
      <Footer />
    </>
  );
}
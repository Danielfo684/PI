import { useState, useEffect } from "react";
import { Navigate, Link } from "react-router-dom";
import type { JSX } from "react";
import { Header } from "../../components/header/Header";
import "./LoginPage.css";
import { Footer } from "../../components/footer/Footer";
import { usePageTitle } from "../../hooks/usePageTitle";

export function LoginPage(): JSX.Element {
  usePageTitle("Quizify - Inicio de sesión");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loggedIn, setLoggedIn] = useState<boolean>(false);

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (token) {
      setLoggedIn(true);
    }
  }, []);

  const handleLogin = async () => {
    try {
      const response = await fetch("http://localhost:5000/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ email, password }),
      });
      const data = await response.json();
      console.log("Login response:", data);
      if (!response.ok) {
        setError(data.error);
      } else {
        localStorage.setItem("token", data.token);
        localStorage.setItem("userId", data.user.id);
        setLoggedIn(true);
      }
    } catch (err) {
      setError("Error de conexión con el servidor");
    }
  };

  if (loggedIn) {
    return <Navigate to="/user" />;
  }

  return (
    <>
      <Header />
      <div className="login-page">
        <h2>Iniciar sesión</h2>
        <div className="login-container">
          {error && (
            <p className="error">
              <img 
                src="/src/assets/images/error.png" 
                alt="Error" 
                className="error-icon"
              />
              {error}
            </p>
          )}
          <form
            onSubmit={(e) => {
              e.preventDefault();
              handleLogin();
            }}
          >
            <input
              type="email"
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <input
              type="password"
              placeholder="Contraseña"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
            <button type="submit">Entrar</button>
          </form>
          <p className="register-link">
            ¿No tienes una cuenta? <Link to="/register">Regístrate aquí</Link>
          </p>
        </div>
      </div>

        <Footer />
 
    </>
  );
}
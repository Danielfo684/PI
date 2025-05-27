import { useState } from "react";
import { Navigate, Link } from "react-router-dom";
import { Header } from "../../components/header/Header";
import { Footer } from "../../components/footer/Footer";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./RegisterPage.css";

export function RegisterPage() {
  usePageTitle("Quizify - Registrarse");
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [registered, setRegistered] = useState(false);

  const handleRegister = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost:5000/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ username, email, password }),
      });
      const data = await response.json();
      if (!response.ok) {
        setError(data.error);
      } else {
        setRegistered(true);
      }
    } catch (err) {
      setError("Error de conexión con el servidor");
    }
  };

  if (registered) {
    return <Navigate to="/login" replace />;
  }

  return (
    <>
      <Header />
      <div className="register-page">
        <h2>Registrarse</h2>
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
          <form onSubmit={handleRegister}>
            <input
              type="text"
              placeholder="Nombre de usuario"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            />
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
            <button type="submit">Registrarse</button>
          </form>
          <p className="login-link">
            ¿Ya tienes una cuenta? <Link to="/login">Inicia sesión</Link>
          </p>
        </div>
      </div>
      <Footer />
    </>
  );
}
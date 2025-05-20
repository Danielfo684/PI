import { useState, useEffect } from "react";
import { Navigate } from "react-router-dom";
import type { JSX } from "react";
import { Header } from "../../components/header/Header";
import "./LoginPage.css";

export function LoginPage(): JSX.Element {
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
        body: JSON.stringify({ email, password }),
      });
      const data = await response.json();
      if (!response.ok) {
        setError(data.error);
      } else {
        // Se espera que el backend te devuelva un token
        localStorage.setItem("token", data.token);
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
      <div className="login-container">
        <h1>Iniciar sesión</h1>
        {error && <p className="error">{error}</p>}
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
        <button onClick={handleLogin}>Entrar</button>
      </div>
    </>
  );
}
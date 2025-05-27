import { JSX, useState, useEffect } from "react";
import { useNavigate, Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./UserSettingPage.css";
import { Footer } from "../../components/footer/Footer";

export function UserSettingPage(): JSX.Element {
  usePageTitle("Quizify - Configurar perfil");
  const navigate = useNavigate();
  
  const [name, setName] = useState<string>("");
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [error, setError] = useState<string>("");
  const [success, setSuccess] = useState<string>("");

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const res = await fetch("http://localhost:5000/api/user", {
          method: "GET",
          credentials: "include"
        });
        const data = await res.json();
        if (res.ok) {
          setName(data.user.name);
          setEmail(data.user.email);
        } else {
          setError(data.error);
        }
      } catch (err) {
        console.error("Error al obtener datos del usuario:", err);
        setError("Error de conexión con el servidor");
      }
    };
    fetchUser();
  }, []);

  const handleSave = async () => {
    try {
      const res = await fetch("http://localhost:5000/api/user", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({
          username: name,
          email: email,
          password: password
        })
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error);
        setSuccess("");
      } else {
        setSuccess("Perfil actualizado correctamente");
        setError("");
      }
    } catch (err) {
      console.error("Error al actualizar el perfil:", err);
      setError("Error de conexión con el servidor");
      setSuccess("");
    }
  };

  return (
    <>
      <div className="user-settings">
        <h2>Configuración de usuario</h2>
        <div className="login-container">
          <form
            onSubmit={(e) => {
              e.preventDefault();
              handleSave();
            }}
          >
            {(error || success) && (
              <p className={error ? "error" : "success"}>
                {error && (
                  <img 
                    src="/src/assets/images/error.png" 
                    alt="Error" 
                    className="error-icon"
                  />
                )}
                {success ? success : error}
              </p>
            )}
            <input
              type="text"
              placeholder="Nombre"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
            <input
              type="email"
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <input
              type="password"
              placeholder="Nueva contraseña (opcional)"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
            <button type="submit">Guardar cambios</button>
          </form>
          <p className="register-link">
            <Link to="/user">Cancelar</Link>
          </p>
        </div>
        <Link to="/user" className="btn-back">
          <button>Volver al perfil</button>
        </Link>
      </div>
      <Footer />
    </>
  );
}
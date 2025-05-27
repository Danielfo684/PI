import { JSX, useState, useEffect } from "react";
import { useNavigate, Link } from "react-router-dom";
import { usePageTitle } from "../../hooks/usePageTitle";
import "./UserSettingPage.css";

export function UserSettingPage(): JSX.Element {
  usePageTitle("Quizify - Configurar perfil");
  const navigate = useNavigate();
  const [name, setName] = useState<string>("");
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [error, setError] = useState<string>("");

  // Cargar datos actuales del usuario
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
          password: password // por si al actualizar la contraseña
                            // no se cambia y asi no se envía el campo
        })
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error);
      } else {
        alert("Perfil actualizado correctamente");
        navigate("/user", { replace: true });
      }
    } catch (err) {
      console.error("Error al actualizar el perfil:", err);
      setError("Error de conexión con el servidor");
    }
  };

  const handleCancel = () => {
    navigate("/user");
  };

  return (
    <div className="user-settings">
      <h1>Configuración de Usuario</h1>
      {error && <p className="error">{error}</p>}
      <form
        className="settings-form"
        onSubmit={(e) => {
          e.preventDefault();
          handleSave();
        }}
      >
        <label>
          Nombre:
          <input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </label>
        <label>
          Email:
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </label>
        <label>
          Contraseña:
          <input
            type="password"
            placeholder="Nueva contraseña (opcional)"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </label>
        <div className="form-buttons">
          <button type="submit">Guardar Cambios</button>
          <button type="button" onClick={handleCancel}>
            Cancelar
          </button>
        </div>
      </form>
      <Link to="/user" className="btn-back">
        Volver al Dashboard
      </Link>
    </div>
  );
}
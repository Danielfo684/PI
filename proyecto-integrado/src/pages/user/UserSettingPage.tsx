import { JSX, useState } from "react";
import { usePageTitle } from "../../hooks/usePageTitle";
import { Link } from "react-router-dom";
import "./UserSettingPage.css";

export function UserSettingPage(): JSX.Element {
  usePageTitle("Configuración de Usuario - Toohak");

  // Datos para simular un perfil luego se cambiara a los datos del server 
  // dani dani
  const [name, setName] = useState<string>("Juan Pérez");
  const [email, setEmail] = useState<string>("juan@example.com");
  const [password, setPassword] = useState<string>("");
  const [profilePic, setProfilePic] = useState<string>("https://placehold.co/100");
  const [bio, setBio] = useState<string>("Esta es mi biografía.");
  const [notificationsEnabled, setNotificationsEnabled] = useState<boolean>(true);
  const [language, setLanguage] = useState<string>("es");

  const handleSave = () => {
    // Aquí se enviarán los datos al servidor vía API
    console.log("Guardando cambios:", {
      name,
      email,
      password,
      profilePic,
      bio,
      notificationsEnabled,
      language,
    });
    // Ejemplo de llamado a API (comentado para futuro uso)
    // fetch("http://localhost:5000/api/user", {
    //   method: "PUT",
    //   headers: {"Content-Type": "application/json"},
    //   body: JSON.stringify({ name, email, password, profilePic, bio, notificationsEnabled, language }),
    // })
    //   .then(response => response.json())
    //   .then(data => console.log("Perfil actualizado:", data))
    //   .catch(error => console.error(error));
  };

  const handleCancel = () => {
    // Reseteo de los datos a unos datos por defecto DE MOMENTO Y DE PRUEBA
    setName("Juan Pérez");
    setEmail("juan@example.com");
    setPassword("");
    setProfilePic("https://placehold.co/100");
    setBio("Esta es mi biografía.");
    setNotificationsEnabled(true);
    setLanguage("es");
  };

  return (
    <div className="user-settings">
      <h1>Configuración de Usuario</h1>
      <form className="settings-form">
        <label>
          Foto de Perfil (URL):
          <input
            type="text"
            value={profilePic}
            onChange={(e) => setProfilePic(e.target.value)}
          />
        </label>
        <div className="profile-preview">
          <img src={profilePic} alt="Preview del perfil" />
        </div>
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
          Biografía:
          <textarea
            value={bio}
            onChange={(e) => setBio(e.target.value)}
            rows={3}
          />
        </label>
        <label>
          Notificaciones:
          <input
            type="checkbox"
            checked={notificationsEnabled}
            onChange={(e) => setNotificationsEnabled(e.target.checked)}
          />
        </label>
        <label>
          Idioma:
          <select value={language} onChange={(e) => setLanguage(e.target.value)}>
            <option value="es">Español</option>
            <option value="en">Inglés</option>
            <option value="fr">Francés</option>
          </select>
        </label>
        <label>
          Contraseña:
          <input
            type="password"
            placeholder="Nueva contraseña"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </label>
        <div className="form-buttons">
          <button type="button" onClick={handleSave}>
            Guardar Cambios
          </button>
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
# Proyecto Integrado

Este proyecto es una aplicación full-stack que consta de dos grandes partes:

- **Cliente (Front-end):** Desarrollado con React y Vite, ubicado en `PI/client/`. Aquí se gestiona la interfaz de usuario, las rutas (por ejemplo, login, dashboard, configuración de usuario, etc.) y la interacción con el backend.
- **Servidor (Back-end):** Basado en Flask, Socket.IO y Eventlet, ubicado en `PI/server/`. Aquí se gestionan las APIs, la conexión a la base de datos MySQL y la lógica de negocio del juego y de las pruebas (tests).

## Estructura del Proyecto

- **phpmyadmin/** - Herramienta de administración de la base de datos MySQL.
- **index.html.bak** - Archivo de respaldo de la página principal.
- **PI/**
  - **.gitignore** - Excluye archivos y carpetas no deseados.
  - **readme.MD** - (Este archivo)
  - **client/**
    - Archivos de configuración para Vite, TypeScript, ESLint, etc.
    - **src/**
      - **main.tsx** - Punto de entrada de la aplicación React.
      - **assets/** - Recursos (imágenes, CSS global, etc.).
      - **components/** - Componentes reutilizables.
      - **hooks/** - Hooks personalizados (como usePageTitle).
      - **pages/** - Páginas de la aplicación (login, dashboard, settings, etc.).
      - **services/** - Lógica para interactuar con APIs y otras funcionalidades.
  - **server/**
    - **.env** - Variables de entorno (configuración de puerto, base de datos, etc.).
    - **config.py** - Carga y manejo de la configuración usando python-dotenv.
    - **index.py** - Punto de entrada del servidor (configuración de Flask, Socket.IO y endpoints API).
    - **scripts/** - Scripts para crear tablas e insertar datos de muestra.
    - **otros directorios**: game/, player/, room/, services/, socket_services/ (con la lógica y módulos de negocio).

## Instalación y Configuración

### Requisitos

- **Node.js** y **npm**
- **Python 3** y **pip**
- MySQL

### Configuración del Cliente

1. Dirígete a la carpeta `PI/client/` y ejecuta:
   ```sh
   npm install
   ```
3. Instalar las dependencias de QRCode:
   ```sh
   npm install react-qr-code
   ```
3. Luego, para iniciar el proyecto:
   ```sh
   npm run dev
   ```
   Esto levantará el servidor de Vite en `http://localhost:5173`.

### Configuración del Servidor

1. Navega a `PI/server/` y activa el entorno virtual (en AWS por ejemplo):
   ```sh
   python3 -m venv env
   source env/bin/activate
   ```
2. Instala las dependencias:
   ```sh
   pip install flask python-socketio eventlet python-dotenv mysql-connector-python flask-cors
   ```
3. Configura la base de datos editando el archivo `.env` (ubicado en `PI/server/`) con los siguientes valores (ejemplo):
   ```properties
   PORT=5000
   CLIENT_URL=http://localhost:5173
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=root
   DB_NAME=proyectointegrado
   ```
4. Crea las tablas e inserta datos de ejemplo:
   ```sh
   source env/bin/activate
   python scripts/create_tables.py
   ```

## Uso y Funcionalidades

- **Login y Autenticación:**  
  El cliente tiene una página de login que envía una solicitud POST a `http://localhost:5000/login`. Una vez autenticado, se guarda un token en `localStorage` y se redirige al dashboard (`/user`).

- **Dashboard y Configuración de Usuario:**  
  La página de usuario (UserMainPage) muestra el área personal del usuario. En UserSettingPage se puede editar la información del perfil.

- **Administración de Tests y Partidas:**  
  El servidor gestiona los tests, preguntas y respuestas, así como los datos asociados a juegos, salas y jugadores.


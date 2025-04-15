import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import './assets/css/index.css'
import App from './App'
import { GamePage } from './pages/game/GamePage'
import { HomePage } from './pages/home/HomePage'
import { HostPage } from './pages/host/HostPage'
import { JoinRoomPage } from './pages/join/JoinRoomPage'
import { Layout } from './components/layout/Layout'
import { UserMainPage } from './pages/user/UserMainPage'
import { UserSettingPage } from './pages/user/UserSettingPage'
const rootElement = document.getElementById('root')

if (!rootElement) {
  throw new Error('Root element not found')
}

createRoot(rootElement).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route element={<Layout />}>
          
          <Route path="/" element={<HomePage />} />
          {/* Páginas de usuario */}
          <Route path="/user" element={<UserMainPage />} />
          <Route path="/user/settings" element={<UserSettingPage />} />
          <Route path="/host" element={<HostPage />} />
          <Route path="/create" element={<HomePage />} />
          <Route path="/host/:id" element={<HostPage />} />
          {/* Páginas de juego invitado*/}
          <Route path="/game/:roomId" element={<GamePage />} />
          <Route path="/join" element={<JoinRoomPage />} />
          {/* Redireccionado si no funciona la ruta */}
          <Route path="*" element={<HomePage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  </StrictMode>
)
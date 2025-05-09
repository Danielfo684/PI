import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import './assets/css/index.css'
import { GameController } from './services/GameController'
import { GamePage } from './pages/game/GamePage'
import { HomePage } from './pages/home/HomePage'
import { HostPage } from './pages/host/HostPage'
import { JoinRoomPage } from './pages/join/JoinRoomPage'
import { Layout } from './components/layout/Layout'
import { UserMainPage } from './pages/user/UserMainPage'
import { UserSettingPage } from './pages/user/UserSettingPage'
import { CreateTestPage } from './pages/create/CreateTestPage'

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
            <Route path="/user" element={<UserMainPage />} />
            <Route path="/user/settings" element={<UserSettingPage />} />
            <Route path="/host" element={<HostPage/>} />
            <Route path="/host/:id" element={<HostPage/>} />
            <Route path="/create" element={<CreateTestPage />} />
          {/* Páginas de juego invitado*/}
          {/* la siguiente ruta solo debe ser accesible desde /join, si no te expulsa */}
          <Route path="/game/:roomId" element={<GamePage />} /> 
          <Route path="/join" element={<JoinRoomPage />} />
          {/* Redireccionado si no funciona la ruta */}
          <Route path="*" element={<HomePage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  </StrictMode>
)
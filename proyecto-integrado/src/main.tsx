import React, { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import './assets/css/index.css'
import { GamePage } from './pages/game/GamePage'
import { HomePage } from './pages/home/HomePage'
import { HostPage } from './pages/host/HostPage'
import { JoinRoomPage } from './pages/join/JoinRoomPage'
import { Layout } from './components/layout/Layout'
import { UserMainPage } from './pages/user/UserMainPage'
import { UserSettingPage } from './pages/user/UserSettingPage'
import { CreateTestPage } from './pages/create/CreateTestPage'
import { EditTestPage } from './pages/edit/EditTestPage'
import { HostingGamePage } from './pages/hostingGamePage/HostingGamePage'
import { MainPage } from './pages/main/MainPage'
import { PlayPage } from './pages/play/PlayPage'
import { LoginPage } from './pages/login/LoginPage'
import Quiz from './pages/pruebaPregunta/Pregunta'
import { ProtectedRoute } from "./components/protectedroute/ProtectedRoute";
import { RegisterPage } from "./pages/register/RegisterPage";


const rootElement = document.getElementById('root')

if (!rootElement) {
  throw new Error('Root element not found')
}

createRoot(rootElement).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/login" element={<LoginPage />} />
        <Route path="/game" element={<GamePage />} />
        <Route path="/register" element={<RegisterPage />} />
        <Route element={<Layout />}>
          <Route path="/home" element={<HomePage />} />
          <Route element={<ProtectedRoute />}>
            <Route path="/user" element={<UserMainPage />} />
            <Route path="/user/settings" element={<UserSettingPage />} />
            <Route path="/host" element={<HostPage />} />
            <Route path="/host/:id" element={<HostingGamePage />} />
            <Route path="/create" element={<CreateTestPage />} />
            <Route path="/edit-test/:id" element={<EditTestPage />} />
            <Route path="/quiz" element={<Quiz />} /> {/* Ruta provisional para editar la interfaz de las preguntas */}
          </Route>
          <Route path="/play" element={<PlayPage />} />
          <Route path="/join" element={<JoinRoomPage />} />
          {/* Other routes */}
        </Route>
      </Routes>
    </BrowserRouter>
  </StrictMode>
)
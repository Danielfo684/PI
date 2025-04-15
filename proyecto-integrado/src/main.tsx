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

const rootElement = document.getElementById('root')

if (!rootElement) {
  throw new Error('Root element not found')
}

createRoot(rootElement).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route element={<Layout />}>
          {/* All these routes will be rendered inside the Layout component */}
          <Route path="/" element={<HomePage />} />
          <Route path="/user" element={<HomePage />} />
          <Route path="/host" element={<HostPage />} />
          <Route path="/create" element={<HomePage />} />
          <Route path="/host/:id" element={<HostPage />} />
          <Route path="/game/:roomId" element={<GamePage />} />
          <Route path="/join" element={<JoinRoomPage />} />
          <Route path="*" element={<App />} />
        </Route>
      </Routes>
    </BrowserRouter>
  </StrictMode>
)
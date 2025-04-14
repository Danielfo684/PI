import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './assets/css/index.css'
import App from './App'
import io from 'socket.io-client'

const rootElement = document.getElementById('root')

if (!rootElement) {
  throw new Error('Root element not found')
}

const socket = io('http://localhost:5000')

socket.on('connect', () => {
  console.log('Connected to socket server')
  createRoot(rootElement).render(
    <StrictMode>
      <App />
    </StrictMode>,
  )
})

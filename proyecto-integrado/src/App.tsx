import { JSX, useState } from 'react'
import '././assets/css/App.css'
import { Card, CardContent, Input, Button } from './components/basicComponents/index'
function App(): JSX.Element {
  const [count, setCount] = useState<number>(0)

  // Define the handler separately for clarity
  const handleClick = () => {
    setCount(prevCount => prevCount + 1)
  }

  return (
    <>
      <h1>Vite + React</h1>
      <div className="counter">
        <button onClick={handleClick}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <div className ="cards-section">
      <Card className="option-1" dataset={1} onClick={handleClick} >
      </Card>
      <Card className="option-2" dataset={2} onClick={handleClick}>
      </Card>
      <Card className="option-3" dataset={3} onClick={handleClick}>
      </Card>
      <Card className="option-4" dataset={4} onClick={handleClick}>
      </Card>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  )
}

export default App
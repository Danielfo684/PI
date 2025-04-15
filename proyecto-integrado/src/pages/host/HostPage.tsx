import { JSX } from "react";
import { Link } from "react-router-dom";

export function HostPage() : JSX.Element {
    

    return (
      <>
        <h1>Select which test do you want to play</h1>
        <div className="counter">
        {/* aquí hacemos un get al server donde cogemos todos los tests de este usuario y los mostramos. Los links van enlazados a una id de host, por lo que host hace un get con id */}
          <button> <Link to="/join">Join Game</Link>
          </button>
          <button> <Link to="/create">Create test</Link>
          </button>
          <button> <Link to="/host">Host game</Link>
          </button>
        </div>
        <div className ="cards-section">
        
        </div>
        <p className="read-the-docs">
          Click on the Vite and React logos to learn more
        </p>
      </>
    )
  }
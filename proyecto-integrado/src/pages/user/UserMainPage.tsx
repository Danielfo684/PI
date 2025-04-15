import { JSX, useState } from "react"
import { Card, CardContent, Input, Button } from '../../components/basicComponents/index'
import {GameController} from "../../services/GameController"
import { Link } from 'react-router-dom';

export function UserMainPage() : JSX.Element {
    

  return (
    <>
      <h1>Welcome to User Section</h1>
      <div className="counter">
        <button> <Link to="/join">Join Game</Link>
        </button>
        <button> <Link to="/create">Create test</Link>
        </button>
        <button> <Link to="/host">Host game</Link>
        </button>
      </div>
      <div className ="cards-section">
      </div>
    </>
  )
}
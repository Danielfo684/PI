import { JSX, useState } from "react"
import { Card, CardContent, Input, Button } from '../../components/basicComponents/index'
import {GameController} from "../../services/GameController"
import { Link } from 'react-router-dom';
import { usePageTitle } from "../../hooks/usePageTitle";

export function HomePage() : JSX.Element {
  usePageTitle("Tookak");

  return (
    <>
      <h1>Welcome to Toohak</h1>
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
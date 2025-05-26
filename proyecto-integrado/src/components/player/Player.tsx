import { JSX, useState } from "react";

import "./player.css";

export const Player = {
    PlayerCard: (props: { name: string, className?: string, id: number, iconNumber?: number, isHost?: boolean, onKick?: (id: number) => void }): JSX.Element => {
        const iconStyle = {
            backgroundImage: `url(/user-icons/${props.iconNumber ?? 1}.png)`,
            backgroundSize: "cover",
            backgroundPosition: "center",
            width: "48px",
            height: "48px",
            borderRadius: "50%",
        };

        return (
            <div className={`player-card ${props.className ?? ""}`}>
                <div className="player-icon" style={iconStyle}></div>
                <div className="player-info">
                    <p><strong>Nombre:</strong> {props.name}</p>
                    <p><strong>ID:</strong> {props.id}</p>
                    {props.isHost && props.onKick && (
                        <button onClick={() => props.onKick?.(props.id)} className="kick-btn">
                            Expulsar
                        </button>
                    )}
                </div>
            </div>
        );
    },
    PlayerPoints: (props: { name: string, points: number, className?: string, id: number, iconNumber?: number }): JSX.Element => {
        const iconStyle = {
            backgroundImage: `url(/icons/${props.iconNumber ?? 1}.png)`,
            backgroundSize: "cover",
            backgroundPosition: "center",
            width: "48px",
            height: "48px",
            borderRadius: "50%",
        };

        return (
            <div className={`player-card player-points ${props.className ?? ""}`}>
                <div className="player-icon" style={iconStyle}></div>
                <div className="player-info">
                    <p><strong>Nombre:</strong> {props.name}</p>
                    <p><strong>ID:</strong> {props.id}</p>
                    <p><strong>Puntos:</strong> {props.points}</p>
                </div>
            </div>
        );
    }
}
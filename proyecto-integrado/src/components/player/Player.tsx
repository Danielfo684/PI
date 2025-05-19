import { JSX, useState } from "react";

import "./player.css";

export const Player = {
    PlayerCard: (props: { name: string, className?: string, id: number, iconNumber?: number }): JSX.Element => {
        const iconStyle = {
            backgroundImage: `url(/icons/${props.iconNumber ?? 1}.png)`, //Aquí tienes que cambiar la url para que funcionen los iconos, Álvaro
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
import { JSX } from "react";
import { CardContent } from ".";

export const Components = {

    Button: (props: { text: string; onClick: () => void; dataset: string; className?: string }): any => {
        return (
            <button
                className={props.className}
                onClick={props.onClick}
                data-id={props.dataset}
            >
                {props.text}
            </button>
        );
    },
    Card: (props: { className?: string; dataset: number; onClick: React.MouseEventHandler<HTMLButtonElement> }): JSX.Element => {
        let cardImage : string = "";
        let backgroundColor : string = "#000000";
        switch (props.dataset) {
            case 1: 
                cardImage = `${props.dataset}`;
                backgroundColor = "#FF0000";
            break;
            case 2:
                cardImage = `${props.dataset}`;
                backgroundColor = "#00FF00";
            break;
            case 3:
                cardImage = `${props.dataset}`;
                backgroundColor = "#0000FF";
            break;
            case 4:
                cardImage = `${props.dataset}`;
                backgroundColor = "#FFFF00";
            break;
        }
        return (
            <button onClick={props.onClick} className={`card ${props.className || ""}`} style={{ backgroundColor: backgroundColor }} data-id={props.dataset}>
                <CardContent dataset={props.dataset} />
            </button>
        );
    },
    CardContent: (props: { dataset: number } ): JSX.Element => {
        return (
                <img src={`./src/assets/images/button${props.dataset || "1"}.png`} alt="" />
        );
    },

    Input: (props: { placeholder: string; value: string; onChange: (e: any) => void; className?: string }): JSX.Element => {
        return (
            <input
                type="text"
                placeholder={props.placeholder}
                value={props.value}
                onChange={props.onChange}
                className={props.className}
            />
        );
    }
}
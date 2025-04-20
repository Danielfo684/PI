import { JSX, useState } from "react";
import { Card, CardContent } from ".";
import "./BasicComponents.css";
import { Answer } from "../../pages/game/GamePage";
import { data } from "react-router-dom";
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
    Card: (props: { className?: string; dataset: number; onClick: React.MouseEventHandler<HTMLButtonElement>; children?: React.ReactNode }): JSX.Element => {
        let cardImage: string = "";

        // por implementar los estados de las respuestas
        const [answer, setAnswer] = useState(false)
        const [selected, setSelected] = useState(false)


        switch (props.dataset) {
            case 1:
                cardImage = `${props.dataset}`;
                break;
            case 2:
                cardImage = `${props.dataset}`;
                break;
            case 3:
                cardImage = `${props.dataset}`;
                break;
            case 4:
                cardImage = `${props.dataset}`;
                break;
        }
        return (
            <button onClick={props.onClick} className={`card ${props.className || ""}`} data-id={props.dataset}>
                {props.children ? props.children : <CardContent dataset={props.dataset} />}
            </button>
        );
    },
    CardContent: (props: { dataset: number }): JSX.Element => {
        return (
            <img src={`../src/assets/images/button${props.dataset || "1"}.png`} alt="" />
        );
    },


    CardSection: (props: { answers: Array<Answer>, handleClick: Function }): JSX.Element => {


        return (
            <div className={`card-section`}>
                {props.answers.map((answer) => {
                    return (
                        <Card className={`option-${answer.id}`} dataset={answer.id} onClick={() => { props.handleClick(answer.id) }} key={answer.id}>
                            <CardContent dataset={answer.id} />
                            <div className="card-text">
                                <h2>{answer.text}</h2>
                            </div>
                        </Card>
                    )
                })}
            </div>
        )


        // <Card className="option-1" dataset={1} onClick={() => handleClick(1)} >
        // </Card>
        // <Card className="option-2" dataset={2} onClick={() => handleClick(2)}>
        // </Card>
        // <Card className="option-3" dataset={3} onClick={() => handleClick(3)}>
        // </Card>
        // <Card className="option-4" dataset={4} onClick={() => handleClick(4)}>
        // </Card>
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
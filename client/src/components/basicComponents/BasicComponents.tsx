import { JSX, useState } from "react";
import { Card, CardContent } from ".";
import "./basicComponents.css";
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
    Card: (props: { className?: string; dataset: number; answer?: boolean, onClick?: React.MouseEventHandler<HTMLButtonElement>; children?: React.ReactNode }): JSX.Element => {
        let cardImage: string = "";

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
    CardContent: (props: { dataset?: number }): JSX.Element => {
        return (
            <img src={`../src/assets/images/button${props.dataset || "1"}.png`} alt="" />
        );
    },


    CardSection: (props: { answers: any, handleClick: Function }): JSX.Element => {
        console.log("answers", props.answers)

        return (
            
            <div className={`card-section`}>
                {props.answers.map((answer : {id: number, text: string, isCorrect: boolean }) => {
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
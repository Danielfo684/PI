import { JSX } from "react";
import { SocketService } from "./SocketService";
// import { GameService } from "./GameService";

export class GameController {
    #states = {
        RIGHT : 0,
        BAD : 1,
    };
    #state: number = 1;
    #gameService = null;
    #SocketService = null;

    constructor(url : string, ui : HTMLElement, gameUI : any) {
        //hay que crear en App lo que sería UIv1 y inicializarla desde aquí
        // Ahora mismo estoy pasando un HTMLElement por pasar algo, pero no tiene sentido
     
        // this.#gameService = new GameService(ui);
        SocketService.init(url, this, () => {
            this.#state = this.#states.RIGHT;
            gameUI.initUI(ui);

        }, () => {
            this.#state = this.#states.BAD;
        });
    }

    // actionController(payload: JSON) {
    //     console.log(payload);
    //     if (this.#state === this.#states.RIGHT)
    //         // this.#gameService.do(payload);
    // }
    // respondController(message : string, payload: JSON) {
    //     console.log(SocketService);
    //         SocketService.controller.socket.emit(message, payload);
    // }
}
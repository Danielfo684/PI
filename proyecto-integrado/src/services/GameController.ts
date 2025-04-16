import { JSX } from "react";
import { SocketService } from "./SocketService";

export class GameController {
    // Private static instance
    private static instance: GameController | null = null;
    
    // States as private properties
    private states = {
        RIGHT: 0,
        BAD: 1,
    };
    private state: number = 1;
    private socketService: any = null;
    private initialized: boolean = false;

    // Private constructor to prevent direct instantiation
    private constructor() {}

    // Static method to get the singleton instance
    public static getInstance(): GameController {
        if (!GameController.instance) {
            GameController.instance = new GameController();
        }
        return GameController.instance;
    }

    // Initialize the controller
    public init(url: string,
        //  ui: HTMLElement, 
        //  gameUI: any): void 
    )
         {
        if (this.initialized) {
            console.warn('GameController already initialized');
            return;
        }
        
        this.socketService = SocketService.init(url, this, () => {
            this.state = this.states.RIGHT;
            // gameUI.initUI(ui);

        }, () => {
            this.state = this.states.BAD;
        });
        
        this.initialized = true;
    }

    // public actionController(payload: any): void {
    //     console.log(payload);
    //     if (this.state === this.states.RIGHT) {
    //         // Process game actions here
    //     }
    // }

    // public respondController(message: string, payload: any): void {
    //     if (this.socketService && this.state === this.states.RIGHT) {
    //         this.socketService.send(message, payload);
    //     }
    // }
    
    // public isConnected(): boolean {
    //     return this.state === this.states.RIGHT;
    // }
}



// // Get the singleton instance
// const gameController = GameController.getInstance();

// // Initialize it
// gameController.init('http://localhost:5000', gameContainer, GameUI);

// // Use it
// if (gameController.isConnected()) {
//     gameController.respondController('move', { x: 10, y: 20 });
// }
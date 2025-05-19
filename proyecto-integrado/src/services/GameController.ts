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
    private constructor() { }

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
    ) {
        if (this.initialized) {
            console.log('GameController already initialized');

        } else {
            this.socketService = SocketService.init(url, this, () => {
                this.state = this.states.RIGHT;

            }, () => {
                this.state = this.states.BAD;
            });

            this.initialized = true;
        }

    }
        public getSocketService() {
    return this.socketService;
}

    public actionController(payload: any): void {
        console.log(payload);
        if (this.state === this.states.RIGHT) {
            if (this.socketService) {
                this.socketService.emitMessage(payload);
                console.log("Sending message", payload.type, payload.content);
            } else {
                console.error("Socket service is not initialized.");
            }

        } else {
            console.error("GameController is not in the right state.");
        }
    }


    // public respondController(message: string, payload: any): void {
    //     if (this.socketService && this.state === this.states.RIGHT) {
    //         this.socketService.send(message, payload);
    //     }
    // }

    // public isConnected(): boolean {
    //     return this.state === this.states.RIGHT;
    // }
}



import { JSX } from "react";
import { SocketService } from "./SocketService";




export class GameController {

    public initialized: boolean = false;
    reset() {
        if (this.socketService && this.socketService.disconnect) {
            this.socketService.disconnect();
        }
        this.socketService = null;
        this.initialized = false;
        this.state = this.states.BAD;
        GameController.instance = null;
    }
    private static instance: GameController | null = null;

    private states = {
        RIGHT: 0,
        BAD: 1,
    };
    private state: number = 1;
    private socketService: any = null;
    private constructor() { }

    public static getInstance(): GameController {
        if (!GameController.instance) {
            GameController.instance = new GameController();
        }

        return GameController.instance;
    }



    public init(url: string,

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

    public isInicialized(): boolean {
        return this.initialized;
    }

    public socketMessage(payload: any): void {
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
}



import io from 'socket.io-client'
import { GameController } from './GameController';

export interface Message {
    type: string;
    content: JSON | unknown;
}

type MessageCallback = (payload: any) => void;

export const SocketService = {
    connected: false as boolean,
    socket: null as any | null,
    url: null as string | null,
    controller: null as GameController | null,
    subscribers: [] as MessageCallback[],

    messageListeners: [] as Array<(payload: any) => void>,

    init: (
        url: string,
        gameController: GameController,
        onConnectedCallBack: Function,
        onDisconnectedCallBack: Function
    ) => {
        SocketService.controller = gameController;
        SocketService.url = url;
        SocketService.socket = io(url);
        SocketService.socket.on("connect", () => {
            console.log("Connected to server");
            SocketService.connected = true;
            onConnectedCallBack();
        });

        SocketService.socket.on("message", SocketService.handleSocketMessage);

        SocketService.socket.on("disconnect", () => {
            console.log("Disconnected from server");
            SocketService.connected = false;
            onDisconnectedCallBack();
        });
        return SocketService;
    },

    handleSocketMessage: (payload: any) => {
        SocketService.messageListeners.forEach(listener => listener(payload));
    },
    onMessage(listener: (payload: any) => void) {
        this.messageListeners.push(listener);
    },
    offMessage(listener: (payload: any) => void) {
        this.messageListeners = this.messageListeners.filter(l => l !== listener);
    },
    emitMessage(message: Message): any {
        SocketService.socket.emit("message", message);
    },


}
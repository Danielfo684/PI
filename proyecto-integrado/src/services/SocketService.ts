import io from 'socket.io-client'
import { GameController } from './GameController';



export interface Message {
    type: string;
    content: JSON | unknown;
  }

export const SocketService = {
    connected: false as boolean,
    socket: null as any | null,
    url: null as string | null,
    controller: null as GameController | null,

    init: (url: string, gameController: GameController, onConnectedCallBack: Function, onDisconnectedCallBack: Function) => {
        SocketService.controller = gameController;
        SocketService.url = url;
        SocketService.socket = io(url);
        SocketService.socket.on("connect", () => {
            console.log("Connected to server");
            SocketService.connected = true;
            onConnectedCallBack();
        });

        SocketService.socket.on("message", (payload: any) => {
            console.log("Received message:", payload);
            // Process message here
        });

        SocketService.socket.on("disconnect", () => {
            console.log("Disconnected from server");
            SocketService.connected = false;
            onDisconnectedCallBack();
        });
        return SocketService; // Return immediately, don't wait for connection
    },

     emitMessage(message: Message): any {

        SocketService.socket.emit("message", message);
    }
}

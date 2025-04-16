import io from 'socket.io-client'
import { GameController } from './GameController';
export const SocketService = {
    connected: false as boolean,
    socket: null as any | null,
    url: null as string | null,
    controller: null as GameController | null,

    init: (url : string, gameController: GameController, onConnectedCallBack : Function, onDisconnectedCallBack : Function) => {
        SocketService.controller = gameController;
        SocketService.socket = io(url);

        SocketService.socket.on("connect", (data: any) => {
            console.log("Connected to server", data);
            SocketService.socket.on("connectionStatus", (data : any) => {
                SocketService.connected = true;
                onConnectedCallBack();
            });
            SocketService.socket.on("message", (payload : any) => {
                // SocketService.controller.actionController(payload);
                //socket.emit("message",{ type: "HELLO", content: "Hello world!"});
            })
            SocketService.socket.on("disconnect", () => {
                SocketService.connected = false;
                onDisconnectedCallBack();
            });
            return SocketService;
        })
    }
}

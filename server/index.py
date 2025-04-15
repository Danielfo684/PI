from flask import Flask, jsonify
from config import config
import socketio
import eventlet
from socket_services.SocketService import SocketService

app = Flask(__name__)

sio = socketio.Server(
    cors_allowed_origins="*",
    logger=False,
    engineio_logger=False
)
app.wsgi_app = socketio.WSGIApp(sio, app.wsgi_app)

socket_service = SocketService.get_instance(sio)
socket_service.init()

@app.route("/")
def hello():
    return jsonify(message="Hello World!")

if __name__ == "__main__":
    try:
        print(f"Connected successfully on port {config.PORT}")
        eventlet.wsgi.server(eventlet.listen(("", config.PORT)), app, log_output=False) # Quito los logs de salida
    except Exception as error:
        print(f"Error occurred: {error}")
import os
from flask import Flask, jsonify
from config import config
import socketio
import eventlet
from socket_services.SocketService import SocketService 
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

sio = socketio.Server(
    cors_allowed_origins="*",
    logger=False,
    engineio_logger=False
)
app.wsgi_app = socketio.WSGIApp(sio, app.wsgi_app)

socket_service = SocketService.get_instance(sio)
socket_service.register_events()

@app.route("/")
def hello():
    return jsonify(message="Hello World!")

@app.route("/db_test")
def db_test():
    connection = None
    try:
        connection = mysql.connector.connect(
            host=config.DB_HOST,
            port=config.DB_PORT,
            user=config.DB_USER,
            password=config.DB_PASSWORD,
            database=config.DB_NAME
        )
        if connection.is_connected():
            version = connection.server_info
            return jsonify(message=f"Conexión exitosa a MySQL versión {version}")
    except Error as e:
        return jsonify(error=str(e)), 500
    finally:
        if connection and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    try:
        print(f"Connected successfully on port {config.PORT}")
        eventlet.wsgi.server(eventlet.listen(("", config.PORT)), app, log_output=False)
    except Exception as error:
        print(f"Error occurred: {error}")
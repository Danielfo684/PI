import os
from flask import Flask, jsonify, request
from config import config
import socketio
import eventlet
from socket_services.SocketService import SocketService 
import mysql.connector
from mysql.connector import Error
from flask_cors import CORS

app = Flask(__name__)
app.secret_key = os.getenv("FLASK_SECRET_KEY", "mi_clave_secreta")

CORS(app, supports_credentials=True, origins=[config.CLIENT_URL])

sio = socketio.Server(
    #cors_allowed_origins="*",
    cors_allowed_origins=[config.CLIENT_URL],
    logger=False,
    engineio_logger=False
)
app.wsgi_app = socketio.WSGIApp(sio, app.wsgi_app)

socket_service = SocketService.get_instance(sio)
socket_service.register_events()

@app.route("/")
def hello():
    return jsonify(message="Hello World!")

# Registra los Blueprints
from api.login import login_api
from api.logout import logout_api
from api.db_test import db_api

app.register_blueprint(login_api)
app.register_blueprint(logout_api)
app.register_blueprint(db_api)

""" @app.after_request
def add_cors_headers(response):
    response.headers["Access-Control-Allow-Credentials"] = "true"
    return response """

if __name__ == "__main__":
    try:
        print(f"Connected successfully on port {config.PORT}")
        eventlet.wsgi.server(eventlet.listen(("", config.PORT)), app, log_output=False)
    except Exception as error:
        print(f"Error occurred: {error}")
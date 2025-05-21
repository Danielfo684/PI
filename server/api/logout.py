from flask import Blueprint, request, jsonify, session

logout_api = Blueprint("logout_api", __name__)

@logout_api.route("/logout", methods=["POST", "OPTIONS"])
def logout():
    if request.method == "OPTIONS":
        return "", 200

    session.clear()
    return jsonify(message="Logout successful"), 200
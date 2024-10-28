from flask import Flask, request, jsonify, url_for
from markupsafe import escape

app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Welcome to the home page.</h1>"

@app.route("/login/<username>/<password>")
def login(username, password):
    profile_url = url_for('profile', username=username)
    return f"Hello, {username}! Go to your profile: <a href='{profile_url}'>Profile</a>"

@app.route('/profile/<username>')
def profile(username):
    # show the post with the given id, the id is an integer
    return f'Profile for {username}'

@app.route('/create_account', methods=["POST"])
def create_account():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')
    return jsonify({'status': 'success', 'username': username, 'password': password}), 201

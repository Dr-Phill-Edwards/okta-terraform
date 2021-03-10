import os
import sqlite3
from flask import Flask, request, jsonify, abort, render_template
from okta_jwt.jwt import validate_token

app = Flask(__name__, static_url_path='', static_folder='client')

@app.route('/', methods=['GET'])
def index():
    return app.send_static_file('index.html')

@app.route('/control.js', methods=['GET'])
def control():
    return render_template('control.js', okta_domain=os.environ['OKTA_DOMAIN'], okta_client_id=os.environ['OKTA_CLIENT_ID'], okta_issuer_uri=os.environ['OKTA_ISSUER_URI'])

@app.route('/<path:file>', methods=['GET'])
def serve_static(file):
    return app.send_static_file(file)

app.run(host='0.0.0.0', port=8080)
from datetime import datetime

from flask import json
import flask
import os

app = flask.Flask(__name__)


@app.route('/hello')
def hello ():
    return "This version is awesome... yeah it is 2.0.1"
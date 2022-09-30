# from models import *
from flask import Flask

from config import Configuration
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config.from_object(Configuration)


@app.route("/")
def index():
    return "<h1> Hello! </h1>"

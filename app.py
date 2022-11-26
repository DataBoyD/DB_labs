# from models import *
from flask import Flask
from flask_login import LoginManager
from flask_security import SQLAlchemyUserDatastore, Security

from config import Configuration
from flask_sqlalchemy import SQLAlchemy
from models import User, Role
from db_connection import Base

app = Flask(__name__)
app.config.from_object(Configuration)
# user_datastore = SQLAlchemyUserDatastore(Base, User, Role)
# security = Security(Base, user_datastore)
manager = LoginManager(app)
@app.route("/test")
def index():
    return "<h1> Hello! </h1>"

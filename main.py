from app import app
import admin
import models
from auth_system.blueprint import auth_system

if __name__ == "__main__":
    app.register_blueprint(blueprint=auth_system, url_prefix="/auth")
    app.run(port=5001, host="0.0.0.0")



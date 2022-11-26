from flask import Blueprint, render_template, request, redirect, url_for, flash
from sqlalchemy.orm import sessionmaker, scoped_session

from app import manager, app
# from flask_security import SQLAlchemyUserDatastore, Security
from flask_login import current_user, login_user, logout_user, login_required, login_required

from db_connection import engine
from models import User
from werkzeug.security import generate_password_hash, check_password_hash

auth_system = Blueprint("auth_system", __name__, template_folder="templates")
session_factory = sessionmaker(bind=engine)
Session = scoped_session(session_factory=session_factory)


@manager.user_loader
def load_user(user_id):
    # return User.query.get(user_id)
    return Session.get(User, user_id)


@auth_system.route("/test", methods=["GET"])
def test():
    return "<h1> OK! </h1>"


@auth_system.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":

        login = request.form.get("login")
        password = request.form.get("password")
        user = Session.query(User).filter_by(email=login).first()
        if user:
            if not login or not password:
                flash("Попробуйте ещё раз!")
            else:
                if user.check_password(password):
                    login_user(user)
                    return redirect(url_for('auth_system.test'))
    return render_template("auth_system/loginPage.html")


@auth_system.route("/logout")
def logout():
    logout_user()
    return redirect(url_for("auth_system.login"))


@auth_system.route("/register", methods=["POST", "GET"])
def register():
    if request.method == "POST":
        # name = request.form.get("name")
        # surname = request.form.get("surname")
        password = request.form.get("password")
        email = request.form.get("email")
        if not password or not email:
            flash("Некорректно введённые данные! Пробуйте ещё раз!")
        else:
            user = User(
                email=email,
                active=True,
                password=str(password),
            )

            Session.add(user)
            Session.commit()
            return redirect(url_for("auth_system.login"))
    return render_template("auth_system/registerPage.html")



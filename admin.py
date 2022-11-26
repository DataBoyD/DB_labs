from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView
from sqlalchemy.orm import sessionmaker, scoped_session

from app import app
from db_connection import engine
from models import *

session_factory = sessionmaker(bind=engine)
Session = scoped_session(session_factory=session_factory)
session = Session()


class CustomMixin(ModelView):
    can_export = True


class MyModelView(ModelView):
    def is_accessible(self):
       return current_user.is_authenticated


admin = Admin(app)

admin.add_view(MyModelView(Status, session, name="Статус"))
admin.add_view(MyModelView(Country, session, name="Страна"))
admin.add_view(MyModelView(AirlineCompany, session, name="Аэрокомпания"))
admin.add_view(MyModelView(Voucher, session, name="Путёвка"))
admin.add_view(MyModelView(Client, session, name="Клиент"))
admin.add_view(MyModelView(TourFirm, session, name="Турфирма"))
admin.add_view(MyModelView(Role, session, name="Роли"))
admin.add_view(MyModelView(User, session, name="Пользователи"))







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


admin = Admin(app)
admin.add_view(CustomMixin(Status, session, name="Статус"))
admin.add_view(CustomMixin(Country, session, name="Страна"))
admin.add_view(CustomMixin(AirlineCompany, session, name="Аэрокомпания"))
admin.add_view(CustomMixin(Voucher, session, name="Путёвка"))
admin.add_view(CustomMixin(Client, session, name="Клиент"))
admin.add_view(CustomMixin(TourFirm, session, name="Турфирма"))







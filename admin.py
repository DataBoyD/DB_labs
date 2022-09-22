from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView

from app import db, app
from models import *


class CustomMixin(ModelView):
    can_export = True


admin = Admin(app)
admin.add_view(CustomMixin(Status, db.session, name="Статус"))
admin.add_view(CustomMixin(Country, db.session, name="Страна"))
admin.add_view(CustomMixin(AirlineCompany, db.session, name="Аэрокомпания"))
admin.add_view(CustomMixin(Voucher, db.session, name="Путёвка"))
admin.add_view(CustomMixin(Client, db.session, name="Клиент"))
admin.add_view(CustomMixin(TourFirm, db.session, name="Турфирма"))







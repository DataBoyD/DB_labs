import werkzeug
from flask_login import current_user
from flask_security import RoleMixin, UserMixin

from db_connection import *
from sqlalchemy.orm import relationship, backref, sessionmaker, scoped_session

session_factory = sessionmaker(bind=engine)
Session = scoped_session(session_factory=session_factory)
session = Session()

airline_companies_tour_firms = Table(
    "airline_companies_tour_firms",
    Base.metadata,
    Column("airline_id", Integer, ForeignKey('airline_companies.id', ondelete='CASCADE'), primary_key=True),
    Column("tour_firm_id", Integer, ForeignKey('tour_firms.id', ondelete='CASCADE'), primary_key=True),

)


class AirlineCompany(Base):
    __tablename__ = 'airline_companies'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    tour_firms = relationship("TourFirm", secondary=airline_companies_tour_firms, back_populates="airlines_companies")

    def __str__(self):
        return f"{self.id}: {self.name}"

    def __repr__(self):
        return f"{self.id}: {self.name}"



class Client(Base):
    __tablename__ = 'clients'

    id = Column(Integer, primary_key=True, autoincrement=True)
    first_name = Column(String(255), nullable=False)
    middle_name = Column(String(255))
    last_name = Column(String(255), nullable=False)
    phone_number = Column(Integer, nullable=False)
    age = Column(Integer, nullable=False)

    def __str__(self):
        return f"{self.id}: {self.first_name} {self.last_name}"

    def __repr__(self):
        return f"{self.id}: {self.first_name} {self.last_name}"


class Country(Base):
    __tablename__ = 'countries'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)

    def __str__(self):
        return f"{self.id}: {self.name}"

    def __repr__(self):
        return f"{self.id}: {self.name}"


class Status(Base):
    __tablename__ = 'statuses'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)

    def __str__(self):
        return f"{self.id}: {self.name}"

    def __repr__(self):
        return f"{self.id}: {self.name}"


class TourFirm(Base):
    __tablename__ = 'tour_firms'

    id = Column(Integer, primary_key=True, autoincrement=True)
    company_name = Column(String(255), nullable=False)
    web_site = Column(String(255))
    address = Column(String(255))
    phone_number = Column(Integer)
    airlines_companies = relationship("AirlineCompany", secondary=airline_companies_tour_firms, back_populates="tour_firms")

    def __str__(self):
        return f"{self.id}: {self.company_name}"

    def __repr__(self):
        return f"{self.id}: {self.company_name}"


class Voucher(Base):
    __tablename__ = 'vouchers'

    id = Column(Integer, primary_key=True, autoincrement=True)
    country_id_in = Column(ForeignKey('countries.id', ondelete='CASCADE'))
    country_id_out = Column(ForeignKey('countries.id', ondelete='CASCADE'))
    client_id = Column(ForeignKey('clients.id', ondelete='CASCADE'))
    firm_id = Column(ForeignKey('tour_firms.id', ondelete='CASCADE'))
    price = Column(Integer, nullable=False)
    status_id = Column(ForeignKey('statuses.id', ondelete='CASCADE'))
    date_start = Column(Date)
    date_finish = Column(Date)
    airline_company_id = Column(ForeignKey('airline_companies.id', ondelete='CASCADE'))

    airline_company = relationship('AirlineCompany')
    client = relationship('Client')
    country_in = relationship('Country', primaryjoin='Voucher.country_id_in == Country.id')
    country_out = relationship('Country', primaryjoin='Voucher.country_id_out == Country.id')
    firm = relationship('TourFirm')
    status = relationship('Status')

    def __str__(self):
        return f"{self.id}: {self.firm.name} -- {self.country_in} -> {self.country_out}"

    def __repr__(self):
        return f"{self.id}: {self.firm.name} -- {self.country_in} -> {self.country_out}"


roles_users = Table('roles_users',
                    Base.metadata,
        Column('users_id', Integer(), ForeignKey('users.id')),
        Column('roles_id', Integer(), ForeignKey('roles.id')))


class Role(Base):
    __tablename__ = 'roles'

    id = Column(Integer(), primary_key=True)
    name = Column(String(80), unique=True)
    description = Column(String(255))


class MyUserMixin(UserMixin):
    @staticmethod
    def has_role(name: str) -> bool:
        # role = Role.query.filter_by(name=name).first()
        role = Session.query(Role).filter_by(name=name).first()
        if role and current_user.role and role == current_user.role:
            return True
        else:
            return False

    def check_password(self, password: str) -> bool:
        return self.password == password
        # return werkzeug.security.check_password_hash(self.password, password)

    def encrypt_password(self):
        # self.password = werkzeug.security.generate_password_hash(self.password)
        ...


class User(Base, MyUserMixin):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True)
    email = Column(String(255), unique=True)
    password = Column(String(255))
    active = Column(Boolean())
    confirmed_at = Column(DateTime())
    roles = relationship('Role', secondary=roles_users,
                            backref=backref('users', lazy='dynamic'))

    def __str__(self):
        return f"{self.id}: {self.email}"

    def __repr__(self):
        return f"{self.id}: {self.email}"


# Base.metadata.create_all()
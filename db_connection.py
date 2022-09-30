import datetime
from sqlalchemy import create_engine, text, Table, MetaData, Column, Integer, String, Boolean,\
    Date, DateTime, Text, ForeignKey, BigInteger
from sqlalchemy.orm import declarative_base, relationship

engine = create_engine("postgresql+psycopg2://test_db_user:qwerty@mytemplatedb:5432/lab_2")
Base = declarative_base(bind=engine)
engine.execute("select;")

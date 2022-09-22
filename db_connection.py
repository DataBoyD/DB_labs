import datetime
from sqlalchemy import create_engine, text, Table, MetaData, Column, Integer, String, Boolean,\
    Date, DateTime, Text, ForeignKey, BigInteger
from sqlalchemy.orm import declarative_base, relationship


engine = create_engine("postgresql+psycopg2://test_db_user:qwerty@localhost:54320/lab2")
Base = declarative_base(bind=engine)

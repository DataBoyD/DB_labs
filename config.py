
# sqlacodegen --outfile models.py \
# postgresql://test_db_user:qwerty@localhost:54320/lab2


class Configuration(object):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = "postgresql+psycopg2://test_db_user:qwerty@localhost:54320/lab_2?sslmode=disable"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = "tutorApplication"

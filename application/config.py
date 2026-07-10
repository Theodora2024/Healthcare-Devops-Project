import os


class Config:

    SECRET_KEY = os.getenv("SECRET_KEY", "healthcare-secret-key")

    SQLALCHEMY_DATABASE_URI = "sqlite:///healthcare.db"

    SQLALCHEMY_TRACK_MODIFICATIONS = False
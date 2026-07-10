from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Patient(db.Model):

    id = db.Column(db.Integer, primary_key=True)

    first_name = db.Column(db.String(100), nullable=False)

    last_name = db.Column(db.String(100), nullable=False)

    gender = db.Column(db.String(20))

    age = db.Column(db.Integer)

    phone = db.Column(db.String(20))

    email = db.Column(db.String(120))

    diagnosis = db.Column(db.String(200))

    def __repr__(self):
        return f"<Patient {self.first_name} {self.last_name}>"
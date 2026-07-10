from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()


class Patient(db.Model):

    __tablename__ = "patients"

    id = db.Column(db.Integer, primary_key=True)

    first_name = db.Column(db.String(100), nullable=False)

    last_name = db.Column(db.String(100), nullable=False)

    gender = db.Column(db.String(20), nullable=False)

    age = db.Column(db.Integer)

    phone = db.Column(db.String(20))

    email = db.Column(db.String(120))

    diagnosis = db.Column(db.String(200))

    created_at = db.Column(
        db.DateTime,
        default=datetime.utcnow
    )

    def __repr__(self):
        return f"{self.first_name} {self.last_name}"


class Doctor(db.Model):

    __tablename__ = "doctors"

    id = db.Column(db.Integer, primary_key=True)

    name = db.Column(db.String(100), nullable=False)

    department = db.Column(db.String(100))

    specialization = db.Column(db.String(100))

    phone = db.Column(db.String(20))

    email = db.Column(db.String(100))

    created_at = db.Column(
        db.DateTime,
        default=datetime.utcnow
    )


class Appointment(db.Model):

    __tablename__ = "appointments"

    id = db.Column(db.Integer, primary_key=True)

    patient_id = db.Column(
        db.Integer,
        db.ForeignKey("patients.id")
    )

    doctor_id = db.Column(
        db.Integer,
        db.ForeignKey("doctors.id")
    )

    appointment_date = db.Column(db.Date)

    appointment_time = db.Column(db.String(20))

    status = db.Column(db.String(50))

    patient = db.relationship("Patient")

    doctor = db.relationship("Doctor")


class MedicalRecord(db.Model):

    __tablename__ = "medical_records"

    id = db.Column(db.Integer, primary_key=True)

    patient_id = db.Column(
        db.Integer,
        db.ForeignKey("patients.id")
    )

    doctor_id = db.Column(
        db.Integer,
        db.ForeignKey("doctors.id")
    )

    diagnosis = db.Column(db.String(200))

    prescription = db.Column(db.Text)

    notes = db.Column(db.Text)

    created_at = db.Column(
        db.DateTime,
        default=datetime.utcnow
    )

    patient = db.relationship("Patient")

    doctor = db.relationship("Doctor")
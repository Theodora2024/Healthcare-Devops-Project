from extensions import db
from datetime import datetime


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

    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return f"{self.first_name} {self.last_name}"

    def to_dict(self):
        return {
            "id": self.id,
            "first_name": self.first_name,
            "last_name": self.last_name,
            "gender": self.gender,
            "age": self.age,
            "phone": self.phone,
            "email": self.email,
            "diagnosis": self.diagnosis,
            "created_at": self.created_at.isoformat() if self.created_at else None,
        }


class Doctor(db.Model):

    __tablename__ = "doctors"

    id = db.Column(db.Integer, primary_key=True)

    name = db.Column(db.String(100), nullable=False)

    department = db.Column(db.String(100))

    specialization = db.Column(db.String(100))

    phone = db.Column(db.String(20))

    email = db.Column(db.String(100))

    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "department": self.department,
            "specialization": self.specialization,
            "phone": self.phone,
            "email": self.email,
            "created_at": self.created_at.isoformat() if self.created_at else None,
        }


class Appointment(db.Model):

    __tablename__ = "appointments"

    id = db.Column(db.Integer, primary_key=True)

    patient_id = db.Column(db.Integer, db.ForeignKey("patients.id"))

    doctor_id = db.Column(db.Integer, db.ForeignKey("doctors.id"))

    appointment_date = db.Column(db.Date)

    appointment_time = db.Column(db.String(20))

    status = db.Column(db.String(50))

    patient = db.relationship("Patient")

    doctor = db.relationship("Doctor")

    def to_dict(self):
        return {
            "id": self.id,
            "patient_id": self.patient_id,
            "doctor_id": self.doctor_id,
            "appointment_date": (
                self.appointment_date.isoformat() if self.appointment_date else None
            ),
            "appointment_time": self.appointment_time,
            "status": self.status,
        }


class MedicalRecord(db.Model):

    __tablename__ = "medical_records"

    id = db.Column(db.Integer, primary_key=True)

    patient_id = db.Column(db.Integer, db.ForeignKey("patients.id"))

    doctor_id = db.Column(db.Integer, db.ForeignKey("doctors.id"))

    diagnosis = db.Column(db.String(200))

    prescription = db.Column(db.Text)

    notes = db.Column(db.Text)

    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    def to_dict(self):
        return {
            "id": self.id,
            "patient_id": self.patient_id,
            "doctor_id": self.doctor_id,
            "diagnosis": self.diagnosis,
            "prescription": self.prescription,
            "notes": self.notes,
            "created_at": (self.created_at.isoformat() if self.created_at else None),
        }

    patient = db.relationship("Patient")

    doctor = db.relationship("Doctor")

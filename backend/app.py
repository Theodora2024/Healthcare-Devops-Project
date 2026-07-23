from flask import Flask, render_template

from config import Config
from routes.patient_routes import patient_bp
from extensions import db
from models import (
    Patient,
    Doctor,
    Appointment,
    MedicalRecord
)
from routes.doctor_routes import doctor_bp
from routes.appointment_routes import appointment_bp
from routes.medical_routes import medical_bp
from routes.api.patients import patients_api
from routes.api.doctors import doctors_api
from routes.api.appointments import appointments_api
from routes.api.medical_records import medical_records_api

app = Flask(__name__)
app.register_blueprint(patients_api)
app.register_blueprint(doctors_api)
app.register_blueprint(appointments_api)
app.register_blueprint(medical_records_api)
app.config.from_object(Config)

app.register_blueprint(patient_bp)
app.register_blueprint(doctor_bp)
app.register_blueprint(appointment_bp)
app.register_blueprint(medical_bp)

db.init_app(app)

with app.app_context():
    db.create_all()

    print("Patients:", Patient.query.count())
    print("Doctors:", Doctor.query.count())


@app.route("/")
def login():
    return render_template("login.html")


@app.route("/dashboard")
def dashboard():

    patient_count = Patient.query.count()

    doctor_count = Doctor.query.count()

    appointment_count = Appointment.query.count()

    medical_record_count = MedicalRecord.query.count()

    recent_patients = (
        Patient.query
        .order_by(Patient.id.desc())
        .limit(5)
        .all()
    )

    return render_template(
        "dashboard.html",
        patient_count=patient_count,
        doctor_count=doctor_count,
        appointment_count=appointment_count,
        medical_record_count=medical_record_count,
        recent_patients=recent_patients
    )


if __name__ == "__main__":
    app.run(debug=True)
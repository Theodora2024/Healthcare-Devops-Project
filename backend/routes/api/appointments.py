
from flask import Blueprint, jsonify
from models import Appointment

appointments_api = Blueprint(
    "appointments_api",
    __name__,
    url_prefix="/api/appointments"
)


@appointments_api.route("/", methods=["GET"])
def get_appointments():

    appointments = Appointment.query.all()

    return jsonify([
        {
            "id": appointment.id,
            "patient_id": appointment.patient_id,
            "doctor_id": appointment.doctor_id,
            "appointment_date": str(appointment.appointment_date),
            "appointment_time": appointment.appointment_time,
            "status": appointment.status
        }
        for appointment in appointments
    ])
from flask import Blueprint, jsonify
from models import Appointment

appointments_api = Blueprint("appointments_api", __name__)

@appointments_api.route("/api/appointments", methods=["GET"])
def get_appointments():
    appointments = Appointment.query.all()
    return jsonify([appointment.to_dict() for appointment in appointments])
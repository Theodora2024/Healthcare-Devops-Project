from flask import Blueprint, jsonify
from models import Patient, Doctor, Appointment, MedicalRecord

dashboard_api = Blueprint("dashboard_api", __name__, url_prefix="/api/dashboard")


@dashboard_api.route("/", methods=["GET"])
def dashboard():

    return jsonify(
        {
            "patients": Patient.query.count(),
            "doctors": Doctor.query.count(),
            "appointments": Appointment.query.count(),
            "records": MedicalRecord.query.count(),
        }
    )

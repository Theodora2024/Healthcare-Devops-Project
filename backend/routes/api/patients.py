from flask import Blueprint, jsonify
from models import Patient

patients_api = Blueprint("patients_api", __name__)


@patients_api.route("/api/patients", methods=["GET"])
def get_patients():
    patients = Patient.query.all()

    data = []

    for patient in patients:
        data.append({
            "id": patient.id,
            "first_name": patient.first_name,
            "last_name": patient.last_name,
            "email": patient.email,
            "phone": patient.phone
        })

    return jsonify(data)

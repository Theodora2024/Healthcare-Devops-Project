
from flask import Blueprint, jsonify
from models import Patient

patients_api = Blueprint("patients_api", __name__, url_prefix="/api/patients")


@patients_api.route("/", methods=["GET"])
def get_patients():

    patients = Patient.query.all()

    return jsonify([
        {
            "id": patient.id,
            "first_name": patient.first_name,
            "last_name": patient.last_name,
            "gender": patient.gender,
            "age": patient.age,
            "phone": patient.phone,
            "email": patient.email,
            "diagnosis": patient.diagnosis
        }
        for patient in patients
    ])
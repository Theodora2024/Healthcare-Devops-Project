from flask import Blueprint, jsonify
from models import Doctor

doctors_api = Blueprint("doctors_api", __name__, url_prefix="/api/doctors")


@doctors_api.route("/", methods=["GET"])
def get_doctors():

    doctors = Doctor.query.all()

    return jsonify(
        [
            {
                "id": doctor.id,
                "name": doctor.name,
                "department": doctor.department,
                "specialization": doctor.specialization,
                "phone": doctor.phone,
                "email": doctor.email,
            }
            for doctor in doctors
        ]
    )

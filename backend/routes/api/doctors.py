from flask import Blueprint, jsonify
from models import Doctor

doctors_api = Blueprint("doctors_api", __name__)

@doctors_api.route("/api/doctors", methods=["GET"])
def get_doctors():
    doctors = Doctor.query.all()
    return jsonify([doctor.to_dict() for doctor in doctors])
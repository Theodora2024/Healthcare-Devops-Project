from flask import Blueprint, jsonify
from models import MedicalRecord

medical_records_api = Blueprint("medical_records_api", __name__)

@medical_records_api.route("/api/medical-records", methods=["GET"])
def get_medical_records():
    records = MedicalRecord.query.all()
    return jsonify([record.to_dict() for record in records])
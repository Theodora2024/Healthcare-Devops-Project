from flask import Blueprint, jsonify
from models import MedicalRecord

medical_records_api = Blueprint(
    "medical_records_api",
    __name__,
    url_prefix="/api/medical-records"
)


@medical_records_api.route("/", methods=["GET"])
def get_medical_records():

    records = MedicalRecord.query.all()

    return jsonify([
        {
            "id": record.id,
            "patient_id": record.patient_id,
            "doctor_id": record.doctor_id,
            "diagnosis": record.diagnosis,
            "prescription": record.prescription,
            "notes": record.notes
        }
        for record in records
    ])
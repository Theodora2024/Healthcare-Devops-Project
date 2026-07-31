from flask import Blueprint, render_template, redirect, url_for, flash

from forms import MedicalRecordForm
from models import db, MedicalRecord, Patient, Doctor

medical_bp = Blueprint("medical", __name__)


@medical_bp.route("/medical-records")
def records():

    records = MedicalRecord.query.order_by(MedicalRecord.id.desc()).all()

    return render_template("medical_records.html", records=records)


@medical_bp.route("/medical-records/add", methods=["GET", "POST"])
def add_record():

    form = MedicalRecordForm()

    form.patient_id.choices = [
        (p.id, f"{p.first_name} {p.last_name}") for p in Patient.query.all()
    ]

    form.doctor_id.choices = [(d.id, d.name) for d in Doctor.query.all()]

    if form.validate_on_submit():

        record = MedicalRecord(
            patient_id=form.patient_id.data,
            doctor_id=form.doctor_id.data,
            diagnosis=form.diagnosis.data,
            prescription=form.prescription.data,
            notes=form.notes.data,
        )

        db.session.add(record)

        db.session.commit()

        flash("Medical record added.", "success")

        return redirect(url_for("medical.records"))

    return render_template("add_record.html", form=form)


@medical_bp.route("/medical-records/edit/<int:id>", methods=["GET", "POST"])
def edit_record(id):

    record = MedicalRecord.query.get_or_404(id)

    form = MedicalRecordForm(obj=record)

    form.patient_id.choices = [
        (p.id, f"{p.first_name} {p.last_name}") for p in Patient.query.all()
    ]

    form.doctor_id.choices = [(d.id, d.name) for d in Doctor.query.all()]

    if form.validate_on_submit():

        form.populate_obj(record)

        db.session.commit()

        flash("Medical record updated.", "success")

        return redirect(url_for("medical.records"))

    return render_template("add_record.html", form=form, edit=True)


@medical_bp.route("/medical-records/delete/<int:id>")
def delete_record(id):

    record = MedicalRecord.query.get_or_404(id)

    db.session.delete(record)

    db.session.commit()

    flash("Medical record deleted.", "warning")

    return redirect(url_for("medical.records"))

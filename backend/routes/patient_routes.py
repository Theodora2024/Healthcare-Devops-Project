from flask import Blueprint, render_template, redirect, url_for, request, flash

from forms import PatientForm
from models import db, Patient

patient_bp = Blueprint("patient", __name__)


@patient_bp.route("/patients")
def patients():

    search = request.args.get("search", "")

    if search:
        patients = Patient.query.filter(
            (Patient.first_name.contains(search)) | (Patient.last_name.contains(search))
        ).all()
    else:
        patients = Patient.query.order_by(Patient.id.desc()).all()

    return render_template("patients.html", patients=patients, search=search)


@patient_bp.route("/patients/add", methods=["GET", "POST"])
def add_patient():

    form = PatientForm()

    if form.validate_on_submit():

        patient = Patient(
            first_name=form.first_name.data,
            last_name=form.last_name.data,
            gender=form.gender.data,
            age=form.age.data,
            phone=form.phone.data,
            email=form.email.data,
            diagnosis=form.diagnosis.data,
        )

        db.session.add(patient)
        db.session.commit()

        flash("Patient added successfully.", "success")

        return redirect(url_for("patient.patients"))

    return render_template("add_patient.html", form=form)


@patient_bp.route("/patients/edit/<int:id>", methods=["GET", "POST"])
def edit_patient(id):

    patient = Patient.query.get_or_404(id)

    form = PatientForm(obj=patient)

    if form.validate_on_submit():

        form.populate_obj(patient)

        db.session.commit()

        flash("Patient updated successfully.", "success")

        return redirect(url_for("patient.patients"))

    return render_template("add_patient.html", form=form, edit=True)


@patient_bp.route("/patients/delete/<int:id>")
def delete_patient(id):

    patient = Patient.query.get_or_404(id)

    db.session.delete(patient)

    db.session.commit()

    flash("Patient deleted.", "warning")

    return redirect(url_for("patient.patients"))

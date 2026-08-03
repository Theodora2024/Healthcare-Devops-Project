from flask import Blueprint, render_template, redirect, url_for, request, flash

from forms import DoctorForm
from models import db, Doctor

doctor_bp = Blueprint("doctor", __name__)


@doctor_bp.route("/doctors")
def doctors():

    search = request.args.get("search", "")

    if search:
        doctors = Doctor.query.filter(Doctor.name.contains(search)).all()
    else:
        doctors = Doctor.query.order_by(Doctor.id.desc()).all()

    return render_template("doctors.html", doctors=doctors, search=search)


@doctor_bp.route("/doctors/add", methods=["GET", "POST"])
def add_doctor():

    form = DoctorForm()

    if form.validate_on_submit():

        doctor = Doctor(
            name=form.name.data,
            department=form.department.data,
            specialization=form.specialization.data,
            phone=form.phone.data,
            email=form.email.data,
        )

        db.session.add(doctor)

        db.session.commit()

        flash("Doctor added successfully.", "success")

        return redirect(url_for("doctor.doctors"))

    return render_template("add_doctor.html", form=form)


@doctor_bp.route("/doctors/edit/<int:id>", methods=["GET", "POST"])
def edit_doctor(id):

    doctor = Doctor.query.get_or_404(id)

    form = DoctorForm(obj=doctor)

    if form.validate_on_submit():

        form.populate_obj(doctor)

        db.session.commit()

        flash("Doctor updated.", "success")

        return redirect(url_for("doctor.doctors"))

    return render_template("add_doctor.html", form=form, edit=True)


@doctor_bp.route("/doctors/delete/<int:id>")
def delete_doctor(id):

    doctor = Doctor.query.get_or_404(id)

    db.session.delete(doctor)

    db.session.commit()

    flash("Doctor deleted.", "warning")

    return redirect(url_for("doctor.doctors"))

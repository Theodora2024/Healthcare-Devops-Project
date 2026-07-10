from flask import Blueprint, render_template, redirect, url_for, flash

from forms import AppointmentForm
from models import db, Appointment, Patient, Doctor

appointment_bp = Blueprint(
    "appointment",
    __name__
)


@appointment_bp.route("/appointments")
def appointments():

    appointments = Appointment.query.order_by(
        Appointment.id.desc()
    ).all()

    return render_template(
        "appointments.html",
        appointments=appointments
    )


@appointment_bp.route("/appointments/add", methods=["GET","POST"])
def add_appointment():

    form = AppointmentForm()

    form.patient_id.choices = [
        (p.id, f"{p.first_name} {p.last_name}")
        for p in Patient.query.all()
    ]

    form.doctor_id.choices = [
        (d.id, d.name)
        for d in Doctor.query.all()
    ]

    if form.validate_on_submit():

        appointment = Appointment(

            patient_id=form.patient_id.data,

            doctor_id=form.doctor_id.data,

            appointment_date=form.appointment_date.data,

            appointment_time=form.appointment_time.data,

            status=form.status.data

        )

        db.session.add(appointment)

        db.session.commit()

        flash(
            "Appointment created successfully.",
            "success"
        )

        return redirect(
            url_for("appointment.appointments")
        )

    return render_template(
        "add_appointment.html",
        form=form
    )


@appointment_bp.route("/appointments/edit/<int:id>",methods=["GET","POST"])
def edit_appointment(id):

    appointment = Appointment.query.get_or_404(id)

    form = AppointmentForm(obj=appointment)

    form.patient_id.choices = [
        (p.id, f"{p.first_name} {p.last_name}")
        for p in Patient.query.all()
    ]

    form.doctor_id.choices = [
        (d.id, d.name)
        for d in Doctor.query.all()
    ]

    if form.validate_on_submit():

        form.populate_obj(appointment)

        db.session.commit()

        flash(
            "Appointment updated.",
            "success"
        )

        return redirect(
            url_for("appointment.appointments")
        )

    return render_template(
        "add_appointment.html",
        form=form,
        edit=True
    )


@appointment_bp.route("/appointments/delete/<int:id>")
def delete_appointment(id):

    appointment = Appointment.query.get_or_404(id)

    db.session.delete(appointment)

    db.session.commit()

    flash(
        "Appointment deleted.",
        "warning"
    )

    return redirect(
        url_for("appointment.appointments")
    )
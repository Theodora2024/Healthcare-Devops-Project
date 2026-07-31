from flask_wtf import FlaskForm
from wtforms import (
    StringField,
    IntegerField,
    SelectField,
    SubmitField,
    DateField,
    TextAreaField,
)
from wtforms.validators import DataRequired, Email, Optional


class PatientForm(FlaskForm):

    first_name = StringField("First Name", validators=[DataRequired()])

    last_name = StringField("Last Name", validators=[DataRequired()])

    gender = SelectField("Gender", choices=[("Male", "Male"), ("Female", "Female")])

    age = IntegerField("Age", validators=[Optional()])

    phone = StringField("Phone", validators=[Optional()])

    email = StringField("Email", validators=[Optional(), Email()])

    diagnosis = StringField("Diagnosis", validators=[Optional()])

    submit = SubmitField("Save Patient")


class DoctorForm(FlaskForm):

    name = StringField("Doctor Name", validators=[DataRequired()])

    department = StringField("Department", validators=[DataRequired()])

    specialization = StringField("Specialization", validators=[DataRequired()])

    phone = StringField("Phone", validators=[Optional()])

    email = StringField("Email", validators=[Optional(), Email()])

    submit = SubmitField("Save Doctor")


class AppointmentForm(FlaskForm):

    patient_id = SelectField("Patient", coerce=int, validators=[DataRequired()])

    doctor_id = SelectField("Doctor", coerce=int, validators=[DataRequired()])

    appointment_date = DateField(
        "Appointment Date", format="%Y-%m-%d", validators=[DataRequired()]
    )

    appointment_time = StringField("Appointment Time", validators=[DataRequired()])

    status = SelectField(
        "Status",
        choices=[
            ("Scheduled", "Scheduled"),
            ("Completed", "Completed"),
            ("Cancelled", "Cancelled"),
        ],
    )

    submit = SubmitField("Save Appointment")


class MedicalRecordForm(FlaskForm):

    patient_id = SelectField("Patient", coerce=int, validators=[DataRequired()])

    doctor_id = SelectField("Doctor", coerce=int, validators=[DataRequired()])

    diagnosis = StringField("Diagnosis", validators=[DataRequired()])

    prescription = TextAreaField("Prescription")

    notes = TextAreaField("Notes")

    submit = SubmitField("Save Record")

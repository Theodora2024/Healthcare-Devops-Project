from datetime import date, datetime, timedelta
import random

from app import app
from models import db, Patient, Doctor, Appointment, MedicalRecord

with app.app_context():

    print("Clearing existing data...")

    MedicalRecord.query.delete()
    Appointment.query.delete()
    Doctor.query.delete()
    Patient.query.delete()

    db.session.commit()

    # -------------------------
    # Patients
    # -------------------------

    patients = []

    for i in range(1, 11):

        patient = Patient(
            first_name=f"Patient{i}",
            last_name="Smith",
            gender=random.choice(["Male", "Female"]),
            age=random.randint(18, 75),
            phone=f"08030000{i:03}",
            email=f"patient{i}@healthcare.com",
            diagnosis=random.choice(
                ["Malaria", "Hypertension", "Diabetes", "Asthma", "Flu"]
            ),
        )

        patients.append(patient)

    db.session.add_all(patients)
    db.session.commit()

    print("✓ 10 Patients added")

    # -------------------------
    # Doctors
    # -------------------------

    doctors = []

    departments = [
        "Cardiology",
        "Pediatrics",
        "Orthopedics",
        "Neurology",
        "General Medicine",
    ]

    for i in range(1, 6):

        doctor = Doctor(
            name=f"Dr. Johnson {i}",
            department=departments[i - 1],
            specialization=departments[i - 1],
            phone=f"09040000{i:03}",
            email=f"doctor{i}@hospital.com",
        )

        doctors.append(doctor)

    db.session.add_all(doctors)
    db.session.commit()

    print("✓ 5 Doctors added")

    # -------------------------
    # Appointments
    # -------------------------

    appointments = []

    for i in range(20):

        appointment = Appointment(
            patient_id=random.choice(patients).id,
            doctor_id=random.choice(doctors).id,
            appointment_date=date.today() + timedelta(days=i),
            appointment_time=random.choice(
                ["09:00 AM", "11:00 AM", "01:00 PM", "03:00 PM"]
            ),
            status=random.choice(["Scheduled", "Completed"]),
        )

        appointments.append(appointment)

    db.session.add_all(appointments)
    db.session.commit()

    print("✓ 20 Appointments added")

    # -------------------------
    # Medical Records
    # -------------------------

    records = []

    for i in range(15):

        record = MedicalRecord(
            patient_id=random.choice(patients).id,
            doctor_id=random.choice(doctors).id,
            diagnosis=random.choice(["Hypertension", "Diabetes", "Asthma", "Malaria"]),
            prescription="Medication prescribed",
            notes="Patient responding well to treatment.",
        )

        records.append(record)

    db.session.add_all(records)
    db.session.commit()

    print("✓ 15 Medical Records added")

    print("\nDatabase seeded successfully!")

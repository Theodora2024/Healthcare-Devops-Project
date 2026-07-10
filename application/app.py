from flask import Flask, render_template

from config import Config
from routes.patient_routes import patient_bp
from models import Doctor, db, Patient
from routes.doctor_routes import doctor_bp
from routes.appointment_routes import appointment_bp
from routes.medical_routes import medical_bp
app = Flask(__name__)

app.config.from_object(Config)

app.register_blueprint(patient_bp)
app.register_blueprint(doctor_bp)
app.register_blueprint(appointment_bp)
app.register_blueprint(medical_bp)
db.init_app(app)

with app.app_context():
    db.create_all()

    print("Patients:", Patient.query.count())
    print("Doctors:", Doctor.query.count())


@app.route("/")
def login():
    return render_template("login.html")


@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")


if __name__ == "__main__":
    app.run(debug=True)
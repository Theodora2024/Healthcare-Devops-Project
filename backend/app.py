from flask import Flask
from flask_cors import CORS
from flask_migrate import Migrate

from config import Config
from extensions import db

# HTML Routes (optional)
from routes.patient_routes import patient_bp
from routes.doctor_routes import doctor_bp
from routes.appointment_routes import appointment_bp
from routes.medical_routes import medical_bp

# API Routes
from routes.api.patients import patients_api
from routes.api.doctors import doctors_api
from routes.api.appointments import appointments_api
from routes.api.medical_records import medical_records_api
from routes.api.dashboard import dashboard_api

app = Flask(__name__)
app.config.from_object(Config)

CORS(app)

db.init_app(app)

migrate = Migrate(app, db)

# Existing Flask routes (keep only if you still need them)
app.register_blueprint(patient_bp)
app.register_blueprint(doctor_bp)
app.register_blueprint(appointment_bp)
app.register_blueprint(medical_bp)

# REST API
app.register_blueprint(patients_api)
app.register_blueprint(doctors_api)
app.register_blueprint(appointments_api)
app.register_blueprint(medical_records_api)
app.register_blueprint(dashboard_api)


if __name__ == "__main__":
    app.run(debug=True)

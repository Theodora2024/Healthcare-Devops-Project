from flask import Flask, render_template

from config import Config
from models import db

app = Flask(__name__)

app.config.from_object(Config)

db.init_app(app)

with app.app_context():
    db.create_all()


@app.route("/")
def login():
    return render_template("login.html")


@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")


@app.route("/patients")
def patients():
    return render_template("patients.html")


@app.route("/doctors")
def doctors():
    return render_template("doctors.html")


@app.route("/appointments")
def appointments():
    return render_template("appointments.html")


@app.route("/medical-records")
def medical_records():
    return render_template("medical_records.html")


if __name__ == "__main__":
    app.run(debug=True)
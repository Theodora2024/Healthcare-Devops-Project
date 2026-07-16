
# 🏥 Healthcare DevOps Platform

A production-style Healthcare Management System built with **Flask**, **PostgreSQL**, **Docker**, **Terraform**, and **AWS**.

This project demonstrates modern DevOps practices including Infrastructure as Code (IaC), containerization, cloud deployment, remote Terraform state management, infrastructure drift detection, disaster recovery, and Git collaboration workflows.

---

## Project Overview

This application enables healthcare providers to manage:

- Patients
- Doctors
- Appointments
- Medical Records

The project was developed using Agile sprint methodology while applying real-world DevOps practices throughout the software development lifecycle.

---

## Architecture

*(Architecture diagram goes here)*

```
User
    │
Internet
    │
EC2 Instance
    │
Docker Compose
 ┌──────────────┐
 │ Flask App    │
 └──────────────┘
        │
 PostgreSQL Database
        │
Terraform provisions:
• VPC
• Subnets
• Security Groups
• IAM
• CloudWatch
• S3 Backend
```

---

# Features

## Healthcare Application

- User Login
- Dashboard
- Patient Management
- Doctor Management
- Appointment Scheduling
- Medical Records

## DevOps Features

- Dockerized application
- PostgreSQL database
- Infrastructure as Code with Terraform
- AWS deployment
- Remote Terraform State
- State Locking
- Drift Detection
- State Recovery
- Infrastructure Recreation
- Git Feature Branch Workflow

---

# Technology Stack

### Backend

- Flask
- SQLAlchemy
- WTForms

### Frontend

- HTML5
- Bootstrap 5
- CSS3
- JavaScript

### Database

- PostgreSQL
- SQLite (Development)

### DevOps

- Docker
- Docker Compose
- Terraform
- Git
- GitHub

### AWS

- EC2
- VPC
- IAM
- S3
- CloudWatch
- Security Groups

---

# Project Structure

```text
healthcare-devops-project/
│
├── application/
├── terraform/
├── docs/
├── screenshots/
└── README.md
```

---

# Local Setup

```bash
git clone <repository>

cd application

python -m venv venv

pip install -r requirements.txt

python app.py
```

---

# Docker Deployment

```bash
docker compose up --build
```

---

# Terraform Deployment

```bash
cd terraform

terraform init

terraform apply -var-file=environments/dev.tfvars
```

---

# Git Workflow

- Created feature branches
- Implemented Git commits
- Pushed to GitHub
- Created Pull Request
- Merged into main

---

# DevOps Operations

Completed:

- Terraform Drift Detection
- Terraform State Recovery
- Infrastructure Recreation
- Docker Deployment
- AWS Deployment

---

# Screenshots

Include screenshots for:

- Login Page
- Dashboard
- Patients
- Doctors
- Appointments
- Medical Records
- Docker Containers
- AWS Console
- Terraform Apply
- Terraform Destroy
- Drift Detection
- State Recovery

---

# Lessons Learned

Throughout this project I gained hands-on experience with:

- Infrastructure as Code
- AWS networking
- Docker containerization
- Remote Terraform state management
- Cloud monitoring
- Git collaboration workflows
- Application deployment
- Disaster recovery techniques

---

# Future Improvements

- Authentication with Flask Login
- CI/CD using GitHub Actions
- Kubernetes deployment
- Load Balancer
- Auto Scaling
- RDS PostgreSQL
- HTTPS using ACM
- Route53 domain integration

---

# Author

**Theodora Egburedi**

Cloud | DevOps | Microsoft 365 Administrator

GitHub: *(your GitHub profile)*

LinkedIn: *(your LinkedIn profile)*
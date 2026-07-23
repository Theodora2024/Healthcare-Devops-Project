import api from "./api";

export const getPatients = () => api.get("/patients");

export const getDoctors = () => api.get("/doctors");

export const getAppointments = () => api.get("/appointments");

export const getMedicalRecords = () => api.get("/medical-records");
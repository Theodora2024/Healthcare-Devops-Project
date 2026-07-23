import api from "./api";

export const getMedicalRecords = async () => {
    const response = await api.get("/medical-records");
    return response.data;
};
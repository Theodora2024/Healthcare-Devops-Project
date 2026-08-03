
import axios from "axios";

const API = "http://localhost:5001/api/medical-records";

export async function getMedicalRecords() {
  const response = await axios.get(API);
  return response.data;
}
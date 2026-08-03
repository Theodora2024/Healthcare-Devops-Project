
// services/dashboardService.js


import axios from "axios";

const API_URL = "http://localhost:5001/api/dashboard";

export async function getDashboard() {
  const response = await axios.get(API_URL);
  return response.data;
}
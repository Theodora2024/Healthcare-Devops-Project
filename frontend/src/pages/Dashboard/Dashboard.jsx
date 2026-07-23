import { useEffect, useState } from "react";
import {
  getPatients,
  getDoctors,
  getAppointments,
  getMedicalRecords,
} from "../../services/dashboardService";

import StatCard from "../../components/dashboard/StatCard";

function Dashboard() {
  const [stats, setStats] = useState({
    patients: 0,
    doctors: 0,
    appointments: 0,
    records: 0,
  });

  useEffect(() => {
    async function loadDashboard() {
      try {
        const [
          patients,
          doctors,
          appointments,
          records,
        ] = await Promise.all([
          getPatients(),
          getDoctors(),
          getAppointments(),
          getMedicalRecords(),
        ]);

        setStats({
          patients: patients.data.length,
          doctors: doctors.data.length,
          appointments: appointments.data.length,
          records: records.data.length,
        });
      } catch (err) {
        console.error(err);
      }
    }

    loadDashboard();
  }, []);

  return (
    <>
      <h1>Dashboard</h1>

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(4,1fr)",
          gap: "20px",
        }}
      >
        <StatCard title="Patients" value={stats.patients} />
        <StatCard title="Doctors" value={stats.doctors} />
        <StatCard title="Appointments" value={stats.appointments} />
        <StatCard title="Medical Records" value={stats.records} />
      </div>
    </>
  );
}

export default Dashboard;
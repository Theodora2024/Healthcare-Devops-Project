import { useEffect, useState } from "react";
import { getDashboard } from "../../services/dashboardService";

function StatCard({ title, value }) {
  return (
    <div
      style={{
        border: "1px solid #ddd",
        borderRadius: "8px",
        padding: "20px",
        textAlign: "center",
        backgroundColor: "#f8f9fa",
      }}
    >
      <h3>{title}</h3>
      <h2>{value}</h2>
    </div>
  );
}

function Dashboard() {
  const [dashboardData, setDashboardData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  useEffect(() => {
    async function loadDashboard() {
      try {
        const data = await getDashboard();
        setDashboardData(data);
      } catch (error) {
        console.error("Error loading dashboard:", error);
      }
    }

    loadDashboard();
  }, []);

  if (!dashboardData) {
    return <h2>Loading dashboard...</h2>;
  }

  return (
    <div>
      <h1>Healthcare Dashboard</h1>

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(4, 1fr)",
          gap: "20px",
          marginTop: "20px",
        }}
      >
        <StatCard title="Patients" value={dashboardData.patients} />
        <StatCard title="Doctors" value={dashboardData.doctors} />
        <StatCard title="Appointments" value={dashboardData.appointments} />
        <StatCard title="Medical Records" value={dashboardData.records} />
      </div>
    </div>
  );
}

export default Dashboard;
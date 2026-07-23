
import { useEffect, useState } from "react";

import { getPatients } from "../../services/patientService";

import PatientTable from "../../components/tables/PatientTable";

function Patients() {
  const [patients, setPatients] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadPatients() {
      try {
        const data = await getPatients();
        setPatients(data);
      } catch (error) {
        console.error("Error loading patients:", error);
      } finally {
        setLoading(false);
      }
    }

    loadPatients();
  }, []);

  if (loading) {
    return <h4>Loading patients...</h4>;
  }

  return (
    <div className="container-fluid">
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h2>Patients</h2>

        <button className="btn btn-primary">
          Add Patient
        </button>
      </div>

      <PatientTable patients={patients} />
    </div>
  );
}

export default Patients;
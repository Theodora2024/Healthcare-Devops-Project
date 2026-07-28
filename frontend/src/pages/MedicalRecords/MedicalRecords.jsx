
import { useEffect, useState } from "react";
import { getMedicalRecords } from "../../services/medicalRecordService";

function MedicalRecords() {
  const [records, setRecords] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  useEffect(() => {
    loadRecords();
  }, []);

  async function loadRecords() {
    try {
      const data = await getMedicalRecords();
      setRecords(data);
    } catch (err) {
      console.error(err);
      setError("Unable to load medical records.");
    } finally {
      setLoading(false);
    }
  }
  return (
    <div>
      <h2>Medical Records</h2>

      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Patient</th>
            <th>Doctor</th>
            <th>Diagnosis</th>
          </tr>
        </thead>

        <tbody>
          {records.map((record) => (
            <tr key={record.id}>
              <td>{record.patient_id}</td>
              <td>{record.doctor_id}</td>
              <td>{record.diagnosis}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default MedicalRecords;
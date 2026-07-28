import { useEffect, useState } from "react";
import { getPatients } from "../../services/patientService";

function Patients() {
  const [patients, setPatients] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    loadPatients();
  }, []);

  async function loadPatients() {
    try {
      const data = await getPatients();
      setPatients(data);
    } catch (err) {
      console.error(err);
      setError("Unable to load patients.");
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return <h3>Loading patients...</h3>;
  }

  if (error) {
    return <h3 style={{ color: "red" }}>{error}</h3>;
  }

  if (patients.length === 0) {
    return <h3>No patients found.</h3>;
  }

  return (
    <div>
      <h2>Patients</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
          </tr>
        </thead>
        <tbody>
          {patients.map((p) => (
            <tr key={p.id ?? p._id}>
              <td>{p.id ?? p._id}</td>
              <td>{p.name}</td>
              <td>{p.age}</td>
              <td>{p.gender}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Patients;
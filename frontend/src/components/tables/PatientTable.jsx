function PatientTable({ patients }) {
  return (
    <div className="table-responsive">
      <table className="table table-striped table-hover">
        <thead className="table-primary">
          <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Diagnosis</th>
          </tr>
        </thead>

        <tbody>
          {patients.length === 0 ? (
            <tr>
              <td colSpan="8" className="text-center">
                No patients found.
              </td>
            </tr>
          ) : (
            patients.map((patient) => (
              <tr key={patient.id}>
                <td>{patient.id}</td>
                <td>{patient.first_name}</td>
                <td>{patient.last_name}</td>
                <td>{patient.gender}</td>
                <td>{patient.age}</td>
                <td>{patient.phone}</td>
                <td>{patient.email}</td>
                <td>{patient.diagnosis}</td>
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
}

export default PatientTable;
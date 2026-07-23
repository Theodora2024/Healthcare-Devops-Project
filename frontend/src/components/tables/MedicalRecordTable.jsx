function MedicalRecordTable({ records }) {
  return (
    <div className="table-responsive">
      <table className="table table-striped table-hover">

        <thead className="table-info">
          <tr>
            <th>ID</th>
            <th>Patient</th>
            <th>Doctor</th>
            <th>Diagnosis</th>
            <th>Prescription</th>
            <th>Notes</th>
          </tr>
        </thead>

        <tbody>
          {records.length === 0 ? (
            <tr>
              <td colSpan="6" className="text-center">
                No medical records found.
              </td>
            </tr>
          ) : (
            records.map((record) => (
              <tr key={record.id}>
                <td>{record.id}</td>
                <td>{record.patient_id}</td>
                <td>{record.doctor_id}</td>
                <td>{record.diagnosis}</td>
                <td>{record.prescription}</td>
                <td>{record.notes}</td>
              </tr>
            ))
          )}
        </tbody>

      </table>
    </div>
  );
}

export default MedicalRecordTable;
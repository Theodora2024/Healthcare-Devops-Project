function DoctorTable({ doctors }) {
  return (
    <div className="table-responsive">
      <table className="table table-striped table-hover">
        <thead className="table-success">
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Specialization</th>
            <th>Phone</th>
            <th>Email</th>
          </tr>
        </thead>

        <tbody>
          {doctors.length === 0 ? (
            <tr>
              <td colSpan="6" className="text-center">
                No doctors found.
              </td>
            </tr>
          ) : (
            doctors.map((doctor) => (
              <tr key={doctor.id}>
                <td>{doctor.id}</td>
                <td>{doctor.name}</td>
                <td>{doctor.department}</td>
                <td>{doctor.specialization}</td>
                <td>{doctor.phone}</td>
                <td>{doctor.email}</td>
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
}

export default DoctorTable;
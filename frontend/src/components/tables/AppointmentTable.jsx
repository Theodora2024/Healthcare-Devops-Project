function AppointmentTable({ appointments }) {

    return (

        <div className="table-responsive">

            <table className="table table-striped table-hover">

                <thead className="table-warning">

                    <tr>
                        <th>ID</th>
                        <th>Patient</th>
                        <th>Doctor</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                    </tr>

                </thead>

                <tbody>

                    {appointments.length === 0 ? (

                        <tr>
                            <td colSpan="6" className="text-center">
                                No appointments found.
                            </td>
                        </tr>

                    ) : (

                        appointments.map((appointment) => (

                            <tr key={appointment.id}>
                                <td>{appointment.id}</td>
                                <td>{appointment.patient_id}</td>
                                <td>{appointment.doctor_id}</td>
                                <td>{appointment.appointment_date}</td>
                                <td>{appointment.appointment_time}</td>
                                <td>{appointment.status}</td>
                            </tr>

                        ))

                    )}

                </tbody>

            </table>

        </div>

    );
}

export default AppointmentTable;
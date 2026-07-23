
import { useEffect, useState } from "react";
import { getAppointments } from "../../services/appointmentService";
import AppointmentTable from "../../components/tables/AppointmentTable";

function Appointments() {

    const [appointments, setAppointments] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {

        async function loadAppointments() {

            try {

                const data = await getAppointments();
                setAppointments(data);

            } catch (error) {

                console.error(error);

            } finally {

                setLoading(false);

            }

        }

        loadAppointments();

    }, []);

    if (loading)
        return <h4>Loading appointments...</h4>;

    return (
        <div className="container-fluid">

            <div className="d-flex justify-content-between align-items-center mb-4">

                <h2>Appointments</h2>

                <button className="btn btn-warning">
                    Add Appointment
                </button>

            </div>

            <AppointmentTable appointments={appointments} />

        </div>
    );
}

export default Appointments;
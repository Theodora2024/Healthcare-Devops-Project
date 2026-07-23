
import { useEffect, useState } from "react";
import { getDoctors } from "../../services/doctorService";
import DoctorTable from "../../components/tables/DoctorTable";

function Doctors() {

    const [doctors, setDoctors] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {

        async function loadDoctors() {

            try {

                const data = await getDoctors();
                setDoctors(data);

            } catch (error) {

                console.error(error);

            } finally {

                setLoading(false);

            }

        }

        loadDoctors();

    }, []);

    if (loading)
        return <h4>Loading doctors...</h4>;

    return (
        <div className="container-fluid">

            <div className="d-flex justify-content-between align-items-center mb-4">

                <h2>Doctors</h2>

                <button className="btn btn-success">
                    Add Doctor
                </button>

            </div>

            <DoctorTable doctors={doctors} />

        </div>
    );
}

export default Doctors;
import { useEffect, useState } from "react";
import { getMedical } from "../../services/ medicalrecordService";
import AppointmentTable from "../../components/tables/MedicalrecordTable";

function MedicalRecords() {

    const [records, setRecords] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {

        async function loadMedicalRecords() {

            try {

                const data = await getMedicalRecords();
                setRecords(data);

            } catch (error) {

                console.error(error);

            } finally {

                setLoading(false);

            }

        }

        loadMedicalRecords();

    }, []);

    if (loading)
        return <h4>Loading medical records...</h4>;

    return (
        <div className="container-fluid">

            <div className="d-flex justify-content-between align-items-center mb-4">

                <h2>Medical Records</h2>

                <button className="btn btn-warning">
                    Add Medical Record
                </button>

            </div>

            <MedicalRecordTable records={records} />

        </div>
    );
}

export default MedicalRecords;
    const [loading, setLoading] = useState(true);

    useEffect(() => {

        async function loadMedicalRecords() {

            try {

                const data = await getMedicalRecords();
                setRecords(data);

            } catch (error) {

                console.error(error);

            } finally {

                setLoading(false);

            }

        }

        loadMedicalRecords();

    }, []);

    if (loading)
        return <h4>Loading medical records...</h4>;

    return (
        <div className="container-fluid">

            <div className="d-flex justify-content-between align-items-center mb-4">

                <h2>Medical Records</h2>

                <button className="btn btn-warning">
                    Add Medical Record
                </button>

            </div>

            <MedicalRecordTable records={records} />

        </div>
    );


export default MedicalRecords;
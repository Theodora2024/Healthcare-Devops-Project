import { BrowserRouter, Routes, Route } from "react-router-dom";

import MainLayout from "./layouts/MainLayout";

import Dashboard from "./pages/Dashboard/Dashboard";
import Patients from "./pages/Patients/Patients";
import Doctors from "./pages/Doctors/Doctors";
import Appointments from "./pages/Appointments/Appointments";
import MedicalRecords from "./pages/MedicalRecords/MedicalRecords";
import Login from "./pages/Login/Login";
import NotFound from "./pages/NotFound/NotFound";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route element={<MainLayout />}>
          <Route index element={<Dashboard />} />
          <Route path="patients" element={<Patients />} />
          <Route path="doctors" element={<Doctors />} />
          <Route path="appointments" element={<Appointments />} />
          <Route path="/medical-records" element={<MedicalRecords />} />
          <Route path="*" element={<NotFound />} />
          
        </Route>

        <Route path="login" element={<Login />} />
        
      </Routes>
    </BrowserRouter>
  );
}

export default App;

import { Link } from "react-router-dom";

function Sidebar() {
  return (
    <aside>
      <h3>Healthcare</h3>

      <ul>
        <li><Link to="/">Dashboard</Link></li>
        <li><Link to="/patients">Patients</Link></li>
        <li><Link to="/doctors">Doctors</Link></li>
        <li><Link to="/appointments">Appointments</Link></li>
      </ul>
    </aside>
  );
}

export default Sidebar;
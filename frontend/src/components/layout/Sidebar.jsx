import { NavLink } from "react-router-dom";

function Sidebar() {
  return (
    <aside>
      <h3>Healthcare</h3>

      <ul>
        <li>
          <NavLink to="/">Dashboard</NavLink>
        </li>

        <li>
          <NavLink to="/patients">Patients</NavLink>
        </li>

        <li>
          <NavLink to="/doctors">Doctors</NavLink>
        </li>

        <li>
          <NavLink to="/appointments">Appointments</NavLink>
        </li>

        <li>
          <NavLink to="/medical-records">
            Medical Records
          </NavLink>
        </li>
      </ul>
    </aside>
  );
}

export default Sidebar;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ProjectDemo
{
    public class TimesheetService : ITimesheetService
    {
        SqlConnection conn;

        public TimesheetService()
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360Connection"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        // Fetch All Timesheets for Admin
        public List<AdminTimesheetModel> FetchAdminTimesheets()
        {
            string q = "exec sp_fetchadmintimesheets";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            var list = new List<AdminTimesheetModel>();

            while (rdr.Read())
            {
                var item = new AdminTimesheetModel
                {
                    TimesheetId = int.Parse(rdr["TimesheetId"].ToString()),
                    EmployeeName = rdr["EmployeeName"].ToString(),
                    CreatedAt = DateTime.Parse(rdr["CreatedAt"].ToString()),
                    ProjectName = rdr["ProjectName"].ToString(),
                    WorkHours = int.Parse(rdr["WorkHours"].ToString()),
                    Status = rdr["Status"].ToString()
                };

                list.Add(item);
            }

            rdr.Close();
            return list;
        }

        // Approve or Reject Timesheet
        public string UpdateTimesheetStatus(int timesheetId, string status)
        {
            string q = $"exec sp_updatetimesheetstatus {timesheetId}, '{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            object res = cmd.ExecuteScalar();
            return res != null ? res.ToString() : "Status updated successfully";
        }

        // Fetch Projects for Dropdown
        public DataTable FetchProjectsDropdown()
        {
            string q = "exec sp_fetchprojectsdropdown";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}

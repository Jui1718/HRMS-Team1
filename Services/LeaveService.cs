using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ProjectDemo
{
    public class LeaveService : ILeaveService
    {
        SqlConnection conn;
        public LeaveService()
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360Connection"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        // Add leave type
        public string SaveLeaveType(MasterLeaveType lt)
        {
            string q = $"exec sp_SaveLeaveType '{lt.LeaveType}', '{lt.Status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            int count = int.Parse(cmd.ExecuteScalar().ToString());
            return count.ToString();
        }

        // Fetch leave types
        public List<MasterLeaveType> FetchLeaveType()
        {
            string q = "exec sp_FetchLeaveType";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            var list = new List<MasterLeaveType>();
            while (rdr.Read())
            {
                var lt = new MasterLeaveType()
                {
                    LeaveTypeId = int.Parse(rdr["LeaveTypeId"].ToString()),
                    LeaveType = rdr["LeaveType"].ToString(),
                    Status = rdr["Status"].ToString()
                };
                list.Add(lt);
            }
            rdr.Close();
            return list;
        }

        // Delete leave type
        public void DeleteLeaveType(int id)
        {
            string q = $"exec sp_DeleteLeaveType '{id}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
        }

        // Allocate leave
        public string AllocateDepartmentLeave(DepartmentLeaves dl)
        {
            string q = $"exec sp_SaveDepartmentLeave {dl.DepartmentId}, {dl.LeaveTypeId}, {dl.LeavesCount}";
            SqlCommand cmd = new SqlCommand(q, conn);
            int count = int.Parse(cmd.ExecuteScalar().ToString());
            return count.ToString();
        }

        // Fetch departments dropdown
        public DataTable FetchDepartmentsDropdown()
        {
            string q = "exec sp_FetchActiveDepartments";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        // Fetch leave types dropdown
        public DataTable FetchLeaveTypesDropdown()
        {
            string q = "exec sp_FetchActiveLeaveTypes";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        // Department leave details
        public List<DepartmentLeaves> FetchDepartmentLeaveDetails()
        {
            string q = "exec sp_FetchDepartmentLeaveDetails";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            var list = new List<DepartmentLeaves>();
            while (rdr.Read())
            {
                var dl = new DepartmentLeaves
                {
                    DepartmentLeavesId = int.Parse(rdr["DepartmentLeavesId"].ToString()),
                    DepartmentName = rdr["DepartmentName"].ToString(),
                    LeaveType = rdr["LeaveType"].ToString(),
                    LeavesCount = int.Parse(rdr["LeavesCount"].ToString()),
                    Status = rdr["Status"].ToString()
                };
                list.Add(dl);
            }

            rdr.Close();
            return list;
        }

        // Delete department leave
        public void DeleteDepartmentLeave(int id)
        {
            string q = $"exec sp_DeleteDepartmentLeave {id}";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
        }

        // Update leave type status
        public string UpdateLeaveTypeStatus(int leaveTypeId, string status)
        {
            string q = $"exec sp_updateleavetypestatus {leaveTypeId}, '{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            int count = int.Parse(cmd.ExecuteScalar().ToString());
            return count.ToString();
        }
    }
}

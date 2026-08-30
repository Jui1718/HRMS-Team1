using Demo.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace Demo.Service
{
    public class ResignationService
    {
        SqlConnection conn;

        public ResignationService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public string Add(Resignation r)
        {
            string q = $"exec sp_ResignAdd {r.UserID}, {r.DepartmentId}, '{r.NoticeDate:yyyy-MM-dd}', '{r.ResignDate:yyyy-MM-dd}', '{r.Reason}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Update(Resignation r)
        {
            string q = $"exec sp_ResignUpdate {r.ResignationId}, {r.UserID}, {r.DepartmentId}, '{r.NoticeDate:yyyy-MM-dd}', '{r.ResignDate:yyyy-MM-dd}', '{r.Reason}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Delete(int resignationId)
        {
            string q = $"exec sp_ResignDelete {resignationId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<Resignation> FetchAll()
        {
            string q = "exec sp_FetchAll";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var list = new List<Resignation>();

            while (rdr.Read())
            {
                list.Add(new Resignation()
                {
                    ResignationId = int.Parse(rdr["ResignationId"].ToString()),
                    UserID = int.Parse(rdr["UserID"].ToString()),
                    EmployeeName = rdr["EmployeeName"].ToString(),
                    DepartmentId = int.Parse(rdr["DepartmentId"].ToString()),
                    DepartmentName = rdr["DepartmentName"].ToString(),
                    NoticeDate = DateTime.Parse(rdr["NoticeDate"].ToString()),
                    ResignDate = DateTime.Parse(rdr["ResignDate"].ToString()),
                    Reason = rdr["Reason"].ToString()
                });
            }
            rdr.Close();
            return list;
        }

        public Resignation GetById(int resignationId)
        {
            string q = $"exec sp_ReGetById {resignationId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            Resignation r = null;

            if (rdr.Read())
            {
                r = new Resignation()
                {
                    ResignationId = int.Parse(rdr["ResignationId"].ToString()),
                    UserID = int.Parse(rdr["UserID"].ToString()),
                    DepartmentId = int.Parse(rdr["DepartmentId"].ToString()),
                    NoticeDate = DateTime.Parse(rdr["NoticeDate"].ToString()),
                    ResignDate = DateTime.Parse(rdr["ResignDate"].ToString()),
                    Reason = rdr["Reason"].ToString()
                };
            }
            rdr.Close();
            return r;
        }
    }

    
    public class OrganizationService
    {
        SqlConnection conn;

        public OrganizationService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public List<Department> GetAll()
        {
            string q = "SELECT DepartmentId, Name as DepartmentName FROM Departments";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var list = new List<Department>();

            while (rdr.Read())
            {
                list.Add(new Department()
                {
                    DepartmentId = int.Parse(rdr["DepartmentId"].ToString()),
                    DepartmentName = rdr["DepartmentName"].ToString()
                });
            }
            rdr.Close();
            return list;
        }
    }

    public class Department
    {
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
    }
}
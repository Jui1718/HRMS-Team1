using Demo.Interface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Runtime.ConstrainedExecution;

namespace Demo.Service
{
    public class TerminationService : ITerminationService
    {
        SqlConnection conn;

        public TerminationService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public string Add(Demo.Model.Termination t)
        {
            string q = $"exec sp_TermiAdd {t.UserID}, '{t.TerminationType}', '{t.NoticeDate:yyyy-MM-dd HH:mm:ss}', '{t.ResignDate:yyyy-MM-dd HH:mm:ss}', '{t.Reason}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }



        public string Delete(int tId)
        {
            string q = $"exec sp_TermiDelete {tId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<Demo.Model.Termination> FetchAll()
        {
            string q = $"exec sp_TermiFetchAll";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var e = new List<Demo.Model.Termination>();

            while (rdr.Read())
            {
                e.Add(new Demo.Model.Termination()
                {
                    TerminationId = int.Parse(rdr["TerminationId"].ToString()),
                    UserID = int.Parse(rdr["UserID"].ToString()),
                    EmployeeName = rdr["EmployeeName"].ToString(),
                    TerminationType = rdr["TerminationType"].ToString(),
                    NoticeDate = DateTime.Parse(rdr["NoticeDate"].ToString()),
                    ResignDate = DateTime.Parse(rdr["ResignDate"].ToString()),
                    ProfilePicture = rdr["ProfilePicture"].ToString(),
                    Reason = rdr["Reason"].ToString()
                });
            }
            rdr.Close();
            return e;
        }

        public Demo.Model.Termination FetchById(int tId)
        {

            string q = $"exec sp_TermiFetchById {tId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            Demo.Model.Termination em = null;

            if (rdr.Read())
            {
                em = new Demo.Model.Termination()
                {
                    TerminationId = int.Parse(rdr["TerminationId"].ToString()),
                    UserID = int.Parse(rdr["UserID"].ToString()),
                    EmployeeName = rdr["EmployeeName"].ToString(),
                    TerminationType = rdr["TerminationType"].ToString(),
                    NoticeDate = DateTime.Parse(rdr["NoticeDate"].ToString()),
                    ResignDate = DateTime.Parse(rdr["ResignDate"].ToString()),
                    Reason = rdr["Reason"].ToString()
                };
            }
            rdr.Close();
            return em;
        }

        public string Update(Demo.Model.Termination ter)
        {
            string q = $"exec sp_TermiUpdate {ter.TerminationId}, {ter.UserID}, '{ter.TerminationType}', '{ter.NoticeDate:yyyy-MM-dd HH:mm:ss}', '{ter.ResignDate:yyyy-MM-dd HH:mm:ss}', '{ter.Reason}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }
    }
}
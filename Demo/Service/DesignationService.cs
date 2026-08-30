using Demo.Interface;
using Demo.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Demo.Service
{
    public class DesignationService : IDesignationService
    {
        SqlConnection conn;

        public DesignationService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }
        public List<Designation> GetAll()
        {
            string q = $"exec sp_Designation_GetAll";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var ev = new List<Designation>();

            while (rdr.Read())
            {
                ev.Add(new Designation()
                {
                    DesignationId = int.Parse(rdr["DesignationId"].ToString()),
                    DesignationName = rdr["DesignationName"].ToString(),

                });
            }
            rdr.Close();
            return ev;
        }
    }
}
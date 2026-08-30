using Demo.Interface;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Role = Demo.Model.Role;

namespace Demo.Service
{
    public class RoleService : IRoleService
    {
        SqlConnection conn;

        public RoleService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public List<Role> FetchAll()
        {
            string q = "SELECT RoleId, RoleName FROM Role";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var r = new List<Role>();

            while (rdr.Read())
            {
                r.Add(new Role()
                {
                    RoleId = int.Parse(rdr["RoleId"].ToString()),
                    RoleName = rdr["RoleName"].ToString()
                });
            }
            rdr.Close();
            return r;
        }
    }
}
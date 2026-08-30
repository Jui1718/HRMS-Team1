using Demo.Interface;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Employee = Demo.Model.Employee;

namespace Demo.Service
{
    public class EmployeeService : IEmployeeService
    {
        SqlConnection conn;

        public EmployeeService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public List<Employee> FetchAll()
        {
            
            string q = "SELECT UserId, FirstName, LastName FROM [User]";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var e = new List<Employee>();

            while (rdr.Read())
            {
                e.Add(new Employee()
                {
                    EmployeeId = int.Parse(rdr["UserId"].ToString()),
                    EmployeeName = rdr["FirstName"].ToString() + " " + rdr["LastName"].ToString()
                });
            }
            rdr.Close();
            return e;
        }
    }
}
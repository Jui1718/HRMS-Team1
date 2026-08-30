using Demo.Interface;
using Demo.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace Demo.Service
{
    public class PromotionService : IPromotionService
    {
        SqlConnection conn;

        public PromotionService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }
        public string Add(Promotion p)
        {
            string q = $"exec sp_ProAdd {p.UserID}, '{p.DesignationFrom}', '{p.DesignationTo}', '{p.PromotionDate:yyyy-MM-dd}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<Employee> All()
        {
            string q = "exec sp_UserFetchAll";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var emp = new List<Employee>();

            while (rdr.Read())
            {
                emp.Add(new Employee()
                {
                    EmployeeId = int.Parse(rdr["EmployeeId"].ToString()),
                    EmployeeName = rdr["EmployeeName"].ToString(),
                    ProfileImage = rdr["ProfileImage"].ToString()

                });
            }
            rdr.Close();
            return emp;
        }

        public string Delete(int pId)
        {
            string q = $"exec sp_PrDelete {pId}";

            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<Promotion> FetchAll()
        {
            string q = $"exec sp_ProFetchAll";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var ev = new List<Promotion>();

            while (rdr.Read())
            {
                ev.Add(new Promotion()
                {
                    PromotionId = int.Parse(rdr["PromotionId"].ToString()),
                    UserID = int.Parse(rdr["UserID"].ToString()),
                    EmployeeName = rdr["EmployeeName"].ToString(),
                    DesignationFrom = rdr["DesignationFrom"].ToString(),
                    DesignationTo = rdr["DesignationTo"].ToString(),
                    PromotionDate = DateTime.Parse(rdr["PromotionDate"].ToString())

                });
            }
            rdr.Close();
            return ev;
        }


        public Promotion GetById(int pId)
        {
            string q = $"exec sp_ProGetById {pId}";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            Promotion e = null;

            if (rdr.Read())
            {
                e = new Promotion()
                {
                    PromotionId = int.Parse(rdr["PromotionId"].ToString()),
                    UserID = int.Parse(rdr["UserID"].ToString()),
                    DesignationFrom = rdr["DesignationFrom"].ToString(),
                    DesignationTo = rdr["DesignationTo"].ToString(),
                    PromotionDate = DateTime.Parse(rdr["PromotionDate"].ToString())

                };
            }
            rdr.Close();
            return e;
        }


        public string Update(Promotion p)
        {
            string q = $"exec sp_ProUpdate {p.PromotionId}, {p.UserID}, '{p.DesignationFrom}', '{p.DesignationTo}', '{p.PromotionDate: yyyy-MM-dd}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }


    }
}
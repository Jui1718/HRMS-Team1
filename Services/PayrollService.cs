using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ProjectDemo
{
    public class PayrollService : IPayrollService
    {
        SqlConnection conn;

        public PayrollService()
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360Connection"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public DataTable FetchUsersDropdown()
        {
            string q = "exec sp_FetchUsersDropdown";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public List<EarningItemModel> FetchEarningsList()
        {
            string q = "exec sp_FetchEarningsList";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            var list = new List<EarningItemModel>();

            while (rdr.Read())
            {
                list.Add(new EarningItemModel
                {
                    EarningsId = int.Parse(rdr["EarningsId"].ToString()),
                    EarningName = rdr["EarningName"].ToString(),
                    EarningsPercentage = decimal.Parse(rdr["EarningsPercentage"].ToString())
                });
            }
            rdr.Close();
            return list;
        }

        public List<DeductionItemModel> FetchDeductionsList()
        {
            string q = "exec sp_FetchDeductionsList";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            var list = new List<DeductionItemModel>();

            while (rdr.Read())
            {
                list.Add(new DeductionItemModel
                {
                    DeductionId = int.Parse(rdr["DeductionId"].ToString()),
                    DeductionName = rdr["DeductionName"].ToString(),
                    DeductionPercentage = decimal.Parse(rdr["DeductionPercentage"].ToString())
                });
            }
            rdr.Close();
            return list;
        }

        public int SaveEmployeeSalary(int userId, decimal totalSalary, decimal netSalary)
        {
            string q = "exec sp_SaveEmployeeSalaryFull " + userId + ", " + totalSalary + ", " + netSalary;
            SqlCommand cmd = new SqlCommand(q, conn);
            object res = cmd.ExecuteScalar();
            return res != null ? int.Parse(res.ToString()) : 0;
        }
    }
}

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
    public class TrainingService : ITrainingService
    {
        SqlConnection conn;

        public TrainingService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public string Add(Training t)
        {
            string q = $"exec sp_TrainingAdd {t.TrainerId}, {t.TrainingTypeId}, {t.UserId}, {t.TrainingCost}, '{t.Description}', '{t.Status}', '{t.StartDate:yyyy-MM-dd}', '{t.EndDate:yyyy-MM-dd}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Update(Training t)
        {
            string q = $"exec sp_TrainingUpdate {t.TrainingId}, {t.TrainerId}, {t.TrainingTypeId}, {t.UserId}, {t.TrainingCost}, '{t.Description}', '{t.Status}', '{t.StartDate:yyyy-MM-dd}', '{t.EndDate:yyyy-MM-dd}', '{t.ModifiedBy}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Delete(int trainingId)
        {
            string q = $"exec sp_TrainingDelete {trainingId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<Training> FetchAll()
        {
            string q = "exec sp_TrainingFetchAll";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var list = new List<Training>();

            while (rdr.Read())
            {
                list.Add(new Training()
                {
                    TrainingId = int.Parse(rdr["TrainingId"].ToString()),
                    TrainerId = int.Parse(rdr["TrainerId"].ToString()),
                    TrainingTypeId = int.Parse(rdr["TrainingTypeId"].ToString()),
                    UserId = int.Parse(rdr["UserId"].ToString()),
                    TrainingCost = decimal.Parse(rdr["TrainingCost"].ToString()),
                    Description = rdr["Description"].ToString(),
                    Status = rdr["Status"].ToString(),
                    StartDate = DateTime.Parse(rdr["StartDate"].ToString()),
                    EndDate = DateTime.Parse(rdr["EndDate"].ToString()),
                    TrainerName = rdr["TrainerName"].ToString(),
                    TrainingTypeName = rdr["TrainingTypeName"].ToString(),
                    EmployeeName = rdr["EmployeeName"].ToString()
                });
            }

            rdr.Close();
            return list;
        }

        public Training GetById(int trainingId)
        {
            string q = $"exec sp_TrainingGetById {trainingId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            Training t = null;

            if (rdr.Read())
            {
                t = new Training()
                {
                    TrainingId = int.Parse(rdr["TrainingId"].ToString()),
                    TrainerId = int.Parse(rdr["TrainerId"].ToString()),
                    TrainingTypeId = int.Parse(rdr["TrainingTypeId"].ToString()),
                    UserId = int.Parse(rdr["UserId"].ToString()),
                    TrainingCost = decimal.Parse(rdr["TrainingCost"].ToString()),
                    Description = rdr["Description"].ToString(),
                    Status = rdr["Status"].ToString(),
                    StartDate = DateTime.Parse(rdr["StartDate"].ToString()),
                    EndDate = DateTime.Parse(rdr["EndDate"].ToString())
                };
            }

            rdr.Close();
            return t;
        }
    }
}
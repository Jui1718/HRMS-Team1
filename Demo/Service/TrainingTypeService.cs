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
    public class TrainingTypeService : ITrainingTypeService
    {
        SqlConnection conn;

        public TrainingTypeService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public string Add(TrainingType t)
        {
            string q = $"exec sp_TrainingTypeAdd '{t.TrainingTypeName}', '{t.Description}', '{t.Status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Update(TrainingType t)
        {
            string q = $"exec sp_TrainingTypeUpdate {t.TrainingTypeId}, '{t.TrainingTypeName}', '{t.Description}', '{t.Status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Delete(int trainingTypeId)
        {
            string q = $"exec sp_TrainingTypeDelete {trainingTypeId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<TrainingType> FetchAll()
        {
            string q = "exec sp_TrainingTypeFetchAll";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var list = new List<TrainingType>();

            while (rdr.Read())
            {
                list.Add(new TrainingType()
                {
                    TrainingTypeId = int.Parse(rdr["TrainingTypeId"].ToString()),
                    TrainingTypeName = rdr["TrainingTypeName"].ToString(),
                    Description = rdr["Description"].ToString(),
                    Status = rdr["Status"].ToString()
                });
            }
            rdr.Close();
            return list;
        }

        public TrainingType GetById(int trainingTypeId)
        {
            string q = $"exec sp_TrainingTypeFetchById {trainingTypeId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            TrainingType t = null;

            if (rdr.Read())
            {
                t = new TrainingType()
                {
                    TrainingTypeId = int.Parse(rdr["TrainingTypeId"].ToString()),
                    TrainingTypeName = rdr["TrainingTypeName"].ToString(),
                    Description = rdr["Description"].ToString(),
                    Status = rdr["Status"].ToString()
                };
            }
            rdr.Close();
            return t;
        }
    }
}
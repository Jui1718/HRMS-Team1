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
    public class TrainerService : ITrainerService
    {
        SqlConnection conn;

        public TrainerService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public string Add(Trainer t)
        {
            string q = $"exec sp_TrainerAdd '{t.FirstName}', '{t.LastName}', '{t.Role}', '{t.Email}', '{t.Description}', '{t.Status}', '{t.Phone}', '{t.ProfilePicture}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Update(Trainer t)
        {
            string q = $"exec sp_TrainerUpdate {t.TrainerId}, '{t.FirstName}', '{t.LastName}', '{t.Role}', '{t.Email}', '{t.Description}', '{t.Status}', '{t.Phone}', '{t.ProfilePicture}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Delete(int trainerId)
        {
            string q = $"exec sp_TrainerDelete {trainerId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<Trainer> FetchAll()
        {
            string q = "exec sp_TrainerFetchAll";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var list = new List<Trainer>();

            while (rdr.Read())
            {
                list.Add(new Trainer()
                {
                    TrainerId = int.Parse(rdr["TrainerId"].ToString()),
                    FirstName = rdr["FirstName"].ToString(),
                    LastName = rdr["LastName"].ToString(),
                    Role = rdr["Role"].ToString(),
                    Email = rdr["Email"].ToString(),
                    Description = rdr["Description"].ToString(),
                    Status = rdr["Status"].ToString(),
                    Phone = rdr["Phone"].ToString(),
                    ProfilePicture = rdr["ProfilePicture"].ToString(),
                    CreatedDate = rdr["CreatedDate"] == DBNull.Value ? DateTime.Now : DateTime.Parse(rdr["CreatedDate"].ToString())
                });
            }
            rdr.Close();
            return list;
        }

        public Trainer GetById(int trainerId)
        {
            string q = $"exec sp_TrainerGetById {trainerId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            Trainer t = null;

            if (rdr.Read())
            {
                t = new Trainer()
                {
                    TrainerId = int.Parse(rdr["TrainerId"].ToString()),
                    FirstName = rdr["FirstName"].ToString(),
                    LastName = rdr["LastName"].ToString(),
                    Role = rdr["Role"].ToString(),
                    Email = rdr["Email"].ToString(),
                    Description = rdr["Description"].ToString(),
                    Status = rdr["Status"].ToString(),
                    Phone = rdr["Phone"].ToString(),
                    ProfilePicture = rdr["ProfilePicture"].ToString(),
                    CreatedDate = DateTime.Parse(rdr["CreatedDate"].ToString())
                };
            }
            rdr.Close();
            return t;
        }
    }
}
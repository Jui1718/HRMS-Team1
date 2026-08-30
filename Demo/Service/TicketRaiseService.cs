using Demo.Interface;
using Demo.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace Demo.Service
{
    public class TicketRaiseService : ITicketRaiseService
    {
        SqlConnection conn;

        public TicketRaiseService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public string Add(TicketRaise t)
        {
            string q = $"exec sp_TicketRaiseAdd '{t.TicketTitle}','{t.TicketDetail}', {t.RaisedBy}, '{t.FilePath}','{t.OriginalFileName}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Update(TicketRaise t)
        {
            string q = $"exec sp_TicketRaiseUpdate {t.TicketId},'{t.TicketTitle}', '{t.TicketDetail}', '{t.FilePath}','{t.OriginalFileName}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string Delete(int ticketId)
        {
            string q = $"exec sp_TicketRaiseDelete {ticketId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<TicketRaise> FetchAll()
        {
            string q = "exec sp_TicketFetchAll";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var list = new List<TicketRaise>();

            while (rdr.Read())
            {
                list.Add(new TicketRaise()
                {
                    TicketId = int.Parse(rdr["TicketId"].ToString()),
                    TicketTitle = rdr["TicketTitle"] == DBNull.Value ? "" : rdr["TicketTitle"].ToString(),
                    TicketDetail = rdr["TicketDetail"].ToString(),
                    RaisedBy = int.Parse(rdr["RaisedBy"].ToString()),
                    RaisedByName = rdr["RaisedByName"].ToString(),
                    AssignedTo = rdr["AssignedTo"] == DBNull.Value ? (int?)null : int.Parse(rdr["AssignedTo"].ToString()),
                    AssignedToName = rdr["AssignedToName"] == DBNull.Value ? "" : rdr["AssignedToName"].ToString(),
                    Status = rdr["Status"] == DBNull.Value ? "" : rdr["Status"].ToString(),
                    FilePath = rdr["FilePath"] == DBNull.Value ? "" : rdr["FilePath"].ToString(),
                    OriginalFileName = rdr["OriginalFileName"] == DBNull.Value ? "" : rdr["OriginalFileName"].ToString(),
                    Solution = rdr["Solution"] == DBNull.Value ? "" : rdr["Solution"].ToString(),
                    SolutionFilePath = rdr["SolutionFilePath"] == DBNull.Value ? "" : rdr["SolutionFilePath"].ToString(),
                    SolutionOriginalFileName = rdr["SolutionOriginalFileName"] == DBNull.Value ? "" : rdr["SolutionOriginalFileName"].ToString(),
                    CreatedAt = DateTime.Parse(rdr["CreatedAt"].ToString())
                });
            }
            rdr.Close();
            return list;
        }

        public TicketRaise GetById(int ticketId)
        {
            string q = $"exec sp_TicketGetById {ticketId}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            TicketRaise t = null;

            if (rdr.Read())
            {
                t = new TicketRaise()
                {
                    TicketId = int.Parse(rdr["TicketId"].ToString()),
                    TicketTitle = rdr["TicketTitle"] == DBNull.Value ? "" : rdr["TicketTitle"].ToString(),
                    TicketDetail = rdr["TicketDetail"].ToString(),
                    RaisedBy = int.Parse(rdr["RaisedBy"].ToString()),
                    RaisedByName = rdr["RaisedByName"].ToString(),
                    FilePath = rdr["FilePath"] == DBNull.Value ? "" : rdr["FilePath"].ToString(),
                    OriginalFileName = rdr["OriginalFileName"] == DBNull.Value ? "" : rdr["OriginalFileName"].ToString(),
                    CreatedAt = DateTime.Parse(rdr["CreatedAt"].ToString())
                };
            }
            rdr.Close();
            return t;
        }

        public string AssignTicket(int ticketId, int assignedTo)
        {
            string q = $"exec sp_TicketAssign {ticketId}, {assignedTo}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string ResolveTicket(int ticketId, string solution, string solutionFilePath, string solutionOriginalFileName)
        {
            string q = $"exec sp_TicketResolve {ticketId}, '{solution}', '{solutionFilePath}', '{solutionOriginalFileName}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }
    }
}
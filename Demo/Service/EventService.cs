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
    public class EventService : IEventService
    {
        SqlConnection conn;

        public EventService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }
        public string AddEvent(Event ev)
        {
            string q = $"exec sp_EventAdd '{ev.Title}', '{ev.Date:yyyy-MM-dd}', {ev.EventTypeId}, '{ev.Status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string DelEvent(int id)
        {
            string q = $"exec sp_EventDelete {id}";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<Event> FetchEvents()
        {
            string q = "exec sp_EventFetch";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var events = new List<Event>();

            while (rdr.Read())
            {
                events.Add(new Event()
                {
                    Id = int.Parse(rdr["Id"].ToString()),
                    Title = rdr["Title"].ToString(),
                    Date = DateTime.Parse(rdr["Date"].ToString()),
                    Status = rdr["Status"].ToString(),
                    Name = rdr["Name"].ToString(),
                    Color = rdr["Color"].ToString()
                });
            }

            rdr.Close();
            return events;
        }

        public Event FindEventById(int id)
        {
            string q = $"exec sp_EventGetById {id}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            Event ev = null;

            if (rdr.Read())
            {
                ev = new Event()
                {
                    Id = int.Parse(rdr["Id"].ToString()),
                    Title = rdr["Title"].ToString(),
                    EventTypeId = int.Parse(rdr["Id"].ToString()),
                    Date = DateTime.Parse(rdr["Date"].ToString()),
                    Status = rdr["Status"].ToString()
                };
            }

            rdr.Close();
            return ev;
        }

        public string UpEvent(Event ev)
        {
            string q = $"exec sp_EventUpdate {ev.Id},'{ev.Title}',{ev.EventTypeId},'{ev.Date:yyyy-MM-dd}','{ev.Status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }
    }
}
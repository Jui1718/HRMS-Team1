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
    public class EventTypeService : IEventTypeService
    {
        SqlConnection conn;

        public EventTypeService()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        public string AddEventType(EventType e)
        {
            string q = $"exec sp_EventTypesAdd '{e.Name}','{e.Color}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public string EventTypeDel(int id)
        {
            string q = $"exec sp_EventTypeDelete '{id}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public EventType EventTypeGetById(int id)
        {
            string q = $"exec sp_EventTypeGetById '{id}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            EventType m = null;

            if (rdr.Read())
            {
                m = new EventType()
                {
                    Id = int.Parse(rdr["Id"].ToString()),
                    Name = rdr["Name"].ToString(),
                    Color = rdr["Color"].ToString()
                };
            }

            rdr.Close();
            return m;
        }

        public string EventTypeUp(EventType et)
        {
            string q = $"exec sp_EventTypeUpdate '{et.Id}','{et.Name}','{et.Color}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            string msg = cmd.ExecuteScalar().ToString();
            return msg;
        }

        public List<EventType> FetchEventType()
        {
            string q = "exec sp_EventTypeFetch";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            var events = new List<EventType>();

            while (rdr.Read())
            {
                events.Add(new EventType()
                {
                    Id = int.Parse(rdr["Id"].ToString()),
                    Name = rdr["Name"].ToString(),
                    Color = rdr["Color"].ToString()
                });
            }

            rdr.Close();
            return events;
        }
    }
}
using Demo.Service;
using System;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;

namespace Demo.Controller
{
    public partial class CalendarEmployeePage : System.Web.UI.Page
    {
        EventService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new EventService();

            if (!IsPostBack)
            {
                BindUpcoming();
            }
        }

        private void BindUpcoming()
        {
            var upcoming = service.FetchEvents()
                .OrderBy(ev => Math.Abs((ev.Date.Date - DateTime.Today).Days))
                .Take(5)
                .ToList();

            RptUpcoming.DataSource = upcoming;
            RptUpcoming.DataBind();
        }

        [WebMethod]
        public static string GetEvents()
        {
            var service = new EventService();
            var events = service.FetchEvents();

            var result = events.Select(ev => new
            {
                id = ev.Id,
                title = ev.Title,
                start = ev.Date.ToString("yyyy-MM-dd"),
                color = string.IsNullOrEmpty(ev.Color) ? "#666666" : ev.Color
            }).ToList();

            var serializer = new JavaScriptSerializer();
            return serializer.Serialize(result);
        }
    }
}
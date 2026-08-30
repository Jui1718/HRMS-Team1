using Demo.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventModel = Demo.Model.Event;

namespace Demo.Controller
{
    public partial class CalendarPage : System.Web.UI.Page
    {
        EventService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new EventService();

            if (!IsPostBack)
            {
                EventTypeList();
                BindUpcoming();
            }
        }

        private void EventTypeList()
        {
            EventTypeService eventTypeService = new EventTypeService();
            var types = eventTypeService.FetchEventType();

            DropDownList1.DataSource = types;
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();
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

        private void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            DropDownList1.ClearSelection();
            HiddenField1.Value = "0";
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            EventTypeList();
            ClearForm();
            Button1.Text = "Add";
            LitModalTitle.Text = "Add Event";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_event')); m.show(); };</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string msg;

            var ev = new EventModel()
            {
                Title = TextBox1.Text,
                EventTypeId = int.Parse(DropDownList1.SelectedValue),
                Date = DateTime.Parse(TextBox2.Text)
            };

            int id = int.Parse(HiddenField1.Value);

            if (id > 0)
            {
                ev.Id = id;
                msg = service.UpEvent(ev);
                Button1.Text = "Add";
            }
            else
            {
                msg = service.AddEvent(ev);
            }

            ClearForm();
            BindUpcoming();

            // Reopen page fresh so FullCalendar re-fetches events, and show the result message
            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
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
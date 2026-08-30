using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using Demo.Service;
using System.Web.UI.WebControls;
using EventModel = Demo.Model.Event;

namespace Demo.Controller
{
    public partial class Event : System.Web.UI.Page
    {
        EventService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new EventService();
            if (!IsPostBack)
            {
                EventTypeList();
                FetchEvent();
            }
        }

        private void FetchEvent()
        {
            var events = service.FetchEvents();
            GvEvent.DataSource = events;
            GvEvent.DataBind();
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

        private void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            DropDownList1.ClearSelection();
            ddlStatus.ClearSelection();
            HiddenField1.Value = "0";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string msg;

            var ev = new EventModel()
            {
                Title = TextBox1.Text,
                EventTypeId = int.Parse(DropDownList1.SelectedValue),
                Date = DateTime.ParseExact(TextBox2.Text.Trim(), "yyyy-MM-dd", CultureInfo.InvariantCulture),
                Status = ddlStatus.SelectedValue
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
            FetchEvent();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            ClearForm();
            Button1.Text = "Add";
            LitModalTitle.Text = "Add Event";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_event')); m.show(); };</script>");
        }

        protected void GvEvent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditRow")
            {
                var obj = service.FindEventById(id);

                HiddenField1.Value = obj.Id.ToString();
                TextBox1.Text = obj.Title;

                if (DropDownList1.Items.FindByValue(obj.EventTypeId.ToString()) != null)
                {
                    DropDownList1.SelectedValue = obj.EventTypeId.ToString();
                }

                TextBox2.Text = obj.Date.ToString("yyyy-MM-dd");
                ddlStatus.SelectedValue = obj.Status;

                Button1.Text = "Update";
                LitModalTitle.Text = "Edit Event";

                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_event')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteRow")
            {
                string msg = service.DelEvent(id);
                FetchEvent();

                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
        }
    }
}
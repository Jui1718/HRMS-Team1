using Demo.Model;
using Demo.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class EventType : System.Web.UI.Page
    {
        EventTypeService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new EventTypeService();

            if (!IsPostBack)
            {
                FetchEvent();
            }
        }

        private void FetchEvent()
        {
            var events = service.FetchEventType();
            GvEventType.DataSource = events;
            GvEventType.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string msg;

            var m = new Demo.Model.EventType()
            {
                Name = TextBox1.Text,
                Color = TextBox2.Text
            };

            int id = int.Parse(HiddenField1.Value);

            if (id > 0)
            {
                m.Id = id;
                msg = service.EventTypeUp(m);
                Button1.Text = "Add Event Type";
            }
            else
            {
                msg = service.AddEventType(m);
            }

            TextBox1.Text = "";
            TextBox2.Text = "";
            HiddenField1.Value = "0";
            FetchEvent();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        protected void GvEventType_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditRow")
            {
                var obj = service.EventTypeGetById(id);

                HiddenField1.Value = obj.Id.ToString();
                TextBox1.Text = obj.Name;
                TextBox2.Text = obj.Color;

                Button1.Text = "Update";
            }
            else if (e.CommandName == "DeleteRow")
            {
                string msg = service.EventTypeDel(id);
                FetchEvent();
                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class ManageLeaveSettings : System.Web.UI.Page
    {
        LeaveService service = new LeaveService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FetchDetails();
            }
        }

        protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
        {
            string search = TextBoxSearch.Text.Trim().ToLower();
            var list = service.FetchLeaveType();

            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(x => x.LeaveType.ToLower().Contains(search) || x.Status.ToLower().Contains(search)).ToList();
            }

            GridView1.DataSource = list;
            GridView1.DataBind();
        }

        protected void CheckBoxStatus_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chk.NamingContainer;
            HiddenField hfId = (HiddenField)row.FindControl("HiddenFieldId");

            if (hfId != null)
            {
                int id = int.Parse(hfId.Value);
                string newStatus = chk.Checked ? "Active" : "Inactive";

                string result = service.UpdateLeaveTypeStatus(id, newStatus);
                FetchDetails();
                Response.Write("<script>alert('" + result + "');</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CustomPolicy")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Response.Write("<script>alert('Custom Policy clicked for Leave Type ID: " + id + "');</script>");
            }
            else if (e.CommandName == "Settings")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Response.Write("<script>alert('Settings clicked for Leave Type ID: " + id + "');</script>");
            }
        }

        public void FetchDetails()
        {
            var list = service.FetchLeaveType();
            GridView1.DataSource = list;
            GridView1.DataBind();
        }
    }
}

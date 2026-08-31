using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class AddLeaveType : System.Web.UI.Page
    {
        LeaveService service = new LeaveService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FetchLeaveTypes();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddLeaveTypeMethod();
        }

        public void AddLeaveTypeMethod()
        {
            string leaveType = TextBox1.Text.Trim();

            if (string.IsNullOrWhiteSpace(leaveType))
            {
                Response.Write("<script>alert('Leave type cannot be empty!')</script>");
                return;
            }

            var lt = new MasterLeaveType
            {
                LeaveType = leaveType,
                Status = "Active"
            };

            string msg = service.SaveLeaveType(lt);
            FetchLeaveTypes();
            TextBox1.Text = "";
            Response.Write("<script>alert('" + msg + "')</script>");
        }

        protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
        {
            string search = TextBoxSearch.Text.Trim().ToLower();
            var list = service.FetchLeaveType();

            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(x => x.LeaveType.ToLower().Contains(search)
                                    || x.Status.ToLower().Contains(search)).ToList();
            }

            GridView1.DataSource = list;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                service.DeleteLeaveType(id);
                FetchLeaveTypes();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
        }
        public void FetchLeaveTypes()
        {
            var list = service.FetchLeaveType();
            GridView1.DataSource = list;
            GridView1.DataBind();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class DepartmentLeaveDetails : System.Web.UI.Page
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
            var list = service.FetchDepartmentLeaveDetails();

            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(x => x.DepartmentName.ToLower().Contains(search) || x.LeaveType.ToLower().Contains(search)|| x.Status.ToLower().Contains(search)).ToList();
            }

            GridView1.DataSource = list;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                service.DeleteDepartmentLeave(id);
                FetchDetails();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
        }

        public void FetchDetails()
        {
            var list = service.FetchDepartmentLeaveDetails();
            GridView1.DataSource = list;
            GridView1.DataBind();
        }
    }
}

using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class AddLeave : System.Web.UI.Page
    {
        LeaveService service = new LeaveService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdowns();
            }
        }

        public void BindDropdowns()
        {
            DataTable dtDept = service.FetchDepartmentsDropdown();
            DropDownListDept.DataSource = dtDept;
            DropDownListDept.DataTextField = "Name";
            DropDownListDept.DataValueField = "DepartmentId";
            DropDownListDept.DataBind();
            DropDownListDept.Items.Insert(0, new ListItem("Select Department", "0"));

            DataTable dtLeave = service.FetchLeaveTypesDropdown();
            DropDownListLeaveType.DataSource = dtLeave;
            DropDownListLeaveType.DataTextField = "LeaveType";
            DropDownListLeaveType.DataValueField = "LeaveTypeId";
            DropDownListLeaveType.DataBind();
            DropDownListLeaveType.Items.Insert(0, new ListItem("Select Leave Type", "0"));
        }

        protected void ButtonAllocate_Click(object sender, EventArgs e)
        {
            if (DropDownListDept.SelectedValue == "0")
            {
                Response.Write("<script>alert('Please select a Department')</script>");
                return;
            }

            if (DropDownListLeaveType.SelectedValue == "0")
            {
                Response.Write("<script>alert('Please select a Leave Type')</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(TextBoxLeavesCount.Text))
            {
                Response.Write("<script>alert('Please enter Number of Leaves')</script>");
                return;
            }

            var dl = new DepartmentLeaves
            {
                DepartmentId = int.Parse(DropDownListDept.SelectedValue),
                LeaveTypeId = int.Parse(DropDownListLeaveType.SelectedValue),
                LeavesCount = int.Parse(TextBoxLeavesCount.Text.Trim())
            };

            string msg = service.AllocateDepartmentLeave(dl);

            DropDownListDept.SelectedIndex = 0;
            DropDownListLeaveType.SelectedIndex = 0;
            TextBoxLeavesCount.Text = "";

            Response.Write("<script>alert('" + msg + "')</script>");
        }
    }
}

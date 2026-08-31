using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class AdminTimesheet : System.Web.UI.Page
    {
        TimesheetService service = new TimesheetService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjects();
                FetchDetails();
            }
        }

        private void BindProjects()
        {
            DataTable dt = service.FetchProjectsDropdown();
            DropDownListProject.DataSource = dt;
            DropDownListProject.DataTextField = "ProjectName";
            DropDownListProject.DataValueField = "ProjectName";
            DropDownListProject.DataBind();
            DropDownListProject.Items.Insert(0, new ListItem("All Projects", ""));
        }

        public void FetchDetails()
        {
            var list = service.FetchAdminTimesheets();

            // Search by Project Name
            string search = TextBoxSearch.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(x => x.ProjectName.ToLower().Contains(search)).ToList();
            }

            // Filter by Status
            string status = DropDownListStatus.SelectedValue;
            if (!string.IsNullOrEmpty(status))
            {
                list = list.Where(x => x.Status.Equals(status, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            // Filter by Project Dropdown
            string project = DropDownListProject.SelectedValue;
            if (!string.IsNullOrEmpty(project))
            {
                list = list.Where(x => x.ProjectName.Equals(project, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            GridView1.DataSource = list;
            GridView1.DataBind();
        }

        protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
        {
            FetchDetails();
        }

        protected void DropDownListStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchDetails();
        }

        protected void DropDownListProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchDetails();
        }

        // Approve Selected Checkboxes
        protected void ButtonApprove_Click(object sender, EventArgs e)
        {
            int count = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("CheckBoxSelect");
                HiddenField hfId = (HiddenField)row.FindControl("HiddenFieldId");

                if (chk != null && chk.Checked && hfId != null)
                {
                    int id = int.Parse(hfId.Value);
                    service.UpdateTimesheetStatus(id, "Approved");
                    count++;
                }
            }

            FetchDetails();
            Response.Write("<script>alert('" + count + " Timesheet(s) Approved Successfully');</script>");
        }

        // Reject Selected Checkboxes
        protected void ButtonReject_Click(object sender, EventArgs e)
        {
            int count = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("CheckBoxSelect");
                HiddenField hfId = (HiddenField)row.FindControl("HiddenFieldId");

                if (chk != null && chk.Checked && hfId != null)
                {
                    int id = int.Parse(hfId.Value);
                    service.UpdateTimesheetStatus(id, "Rejected");
                    count++;
                }
            }

            FetchDetails();
            Response.Write("<script>alert('" + count + " Timesheet(s) Rejected Successfully');</script>");
        }
    }
}

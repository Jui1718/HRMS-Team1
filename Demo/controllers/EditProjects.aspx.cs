using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class EditProjects : System.Web.UI.Page
    {
        ProjectService projectService;


        protected void Page_Load(object sender, EventArgs e)
        {
            projectService = new ProjectService();

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("ProjectList.aspx");
                    return;
                }

                int id = int.Parse(Request.QueryString["id"]);

                Projects p = projectService.fetchProjectById(id);

                TextBox1.Text = p.ProjectName;
                TextBox2.Text = p.ClientName;
                TextBox3.Text = p.Description;

                TextBox4.Text = p.StartDate.ToString("yyyy-MM-dd");
                TextBox5.Text = p.EndDate.ToString("yyyy-MM-dd");

                DropDownList1.SelectedValue = p.Priority;
                TextBox6.Text = p.ProjectValue;
                DropDownList2.SelectedValue = p.PriceType;
                DropDownList3.SelectedValue = p.Status;

              
                LoadProjectMembers(id);

                LoadManagers();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);

            Projects p = new Projects();

            p.ProjectId = id;
            p.ProjectName = TextBox1.Text;
            p.ClientName = TextBox2.Text;
            p.Description = TextBox3.Text;
            p.StartDate = DateTime.Parse(TextBox4.Text);
            p.EndDate = DateTime.Parse(TextBox5.Text);
            p.Priority = DropDownList1.SelectedValue;
            p.ProjectValue = TextBox6.Text;
            p.PriceType = DropDownList2.SelectedValue;
            p.Status = DropDownList3.SelectedValue;

            projectService.updateProject(p);

            Response.Redirect("ProjectList.aspx");
        }
        private void LoadProjectMembers(int projectId)
        {
            ProjectService projectService = new ProjectService();

            List<ProjectMember> members = projectService.GetProjectMembers(projectId);

            CheckBoxList1.DataSource = members;
            CheckBoxList1.DataTextField = "MemberName";
            CheckBoxList1.DataValueField = "UserId";
            CheckBoxList1.DataBind();
        }

        private void LoadManagers()
        {
            List<ProjectManager> managers = projectService.GetProjectManagers();

            DropDownList5.DataSource = managers;
            DropDownList5.DataTextField = "FirstName";
            DropDownList5.DataValueField = "UserId";
            DropDownList5.DataBind();
        }
       
    }
}
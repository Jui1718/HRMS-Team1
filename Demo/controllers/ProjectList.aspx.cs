using System;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class ProjectList : System.Web.UI.Page
    {
        ProjectService projectService;

        protected void Page_Load(object sender, EventArgs e)
        {
            projectService = new ProjectService();

            if (!IsPostBack)
            {
                getProjects();
            }
        }

        public void getProjects()
        {
            var projects = projectService.fetchProject();

            GridView1.DataSource = projects;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProject.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProject")
            {
                int id = int.Parse(e.CommandArgument.ToString());

                string msg = projectService.deleteProject(id);

                getProjects();

                Response.Write("<script>alert('" + msg + "')</script>");
            }

            if (e.CommandName == "EditProject")
            {
                int id = int.Parse(e.CommandArgument.ToString());

                Response.Redirect("EditProjects.aspx?id=" + id);
            }
        }
    }
}
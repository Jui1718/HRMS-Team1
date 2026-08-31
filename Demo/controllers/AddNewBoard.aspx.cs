using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class AddNewBoard : System.Web.UI.Page
    {
        TaskService taskService;
        protected void Page_Load(object sender, EventArgs e)
        {
            taskService = new TaskService();

            if (!IsPostBack)
            {
                LoadProjects();
            }

        }
        private void LoadProjects()
        {
            DropDownList1.DataSource =
                taskService.GetAllProjects();

            DropDownList1.DataTextField =
                "ProjectName";

            DropDownList1.DataValueField =
                "ProjectId";

            DropDownList1.DataBind();

            DropDownList1.Items.Insert(
                0,
                new ListItem(
                    "-- Select Project --",
                    "0"));
        }

        protected void DropDownListProject_SelectedIndexChanged(
     object sender,
     EventArgs e)
        {
            if (DropDownList1.SelectedValue != "0")
            {
                int projectId =
                    Convert.ToInt32(DropDownList1.SelectedValue);

                LoadTasks(projectId);
            }
            else
            {
                DropDownList2.Items.Clear();

                DropDownList2.Items.Insert(
                    0,
                    new ListItem("-- Select Task --", "")
                );
            }
        }

        private void LoadTasks(int projectId)
        {
            DropDownList2.DataSource =
                taskService.GetTasksByProject(projectId);

            DropDownList2.DataTextField = "Title";
            DropDownList2.DataValueField = "TaskId";

            DropDownList2.DataBind();

            DropDownList2.Items.Insert(
                0,
                new ListItem("-- Select Task --", "")
            );
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int projectId =
                Convert.ToInt32(DropDownList1.SelectedValue);

            int taskId =
                Convert.ToInt32(DropDownList2.SelectedValue);

            int percentage =
                Convert.ToInt32(TextBox1.Text);

            DateTime dueDate =
                Convert.ToDateTime(TextBox2.Text);

            taskService.AddTaskBoard(
                projectId,
                taskId,
                percentage,
                dueDate
            );

            Response.Redirect("TaskBoard.aspx?success=1");
        }
    }
}
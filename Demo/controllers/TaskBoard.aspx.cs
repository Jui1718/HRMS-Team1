using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class TaskBoard : System.Web.UI.Page
    {
        TaskService taskService;

        protected void Page_Load(object sender, EventArgs e)
        {
            taskService = new TaskService();

            if (!IsPostBack)
            {
                GetTasks();

                if (Request.QueryString["success"] == "1")
                {
                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "success",
                        "alert('Taskboard added successfully');",
                        true
                    );
                }
            }
        }
        // ALL
        protected void Button2_Click(object sender, EventArgs e)
        {
            GetTasks();
        }

        // HIGH
        protected void Button3_Click(object sender, EventArgs e)
        {
            GetTasksByPriority("High");
        }

        // MEDIUM
        protected void Button4_Click(object sender, EventArgs e)
        {
            GetTasksByPriority("Medium");
        }

        // LOW
        protected void Button5_Click(object sender, EventArgs e)
        {
            GetTasksByPriority("Low");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string status = DropDownList1.SelectedValue;

            if (status == "")
            {
                GetTasks();
            }
            else
            {
                GetTasksByStatus(status);
            }
        }

        //GET ALL TASKS
        private void GetTasks()
        {
            GridView1.DataSource =
                taskService.GetAllTasks();

            GridView1.DataBind();
        }

        // GET TASKS BY PRIORITY
        private void GetTasksByPriority(string priority)
        {
            GridView1.DataSource =
                taskService.GetTasksByPriority(priority);

            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewBoard.aspx");
        }

        private void GetTasksByStatus(string status)
        {
            GridView1.DataSource = taskService.GetTasksByStatus(status);
            GridView1.DataBind();
        }


    }
}
using System;
using System;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class Task : System.Web.UI.Page
    {
        TaskService taskService;

        protected void Page_Load(object sender, EventArgs e)
        {
            taskService = new TaskService();

            if (!IsPostBack)
            {
                GetTasks();
            }
        }

        // ADD TASK
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddTask.aspx");
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

        // SEARCH BY DATE
        protected void Button6_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                DateTime selectedDate =
                    Convert.ToDateTime(TextBox1.Text);

                Repeater1.DataSource =
                    taskService.GetTasksByDate(selectedDate);

                Repeater1.DataBind();
            }
            else
            {
                GetTasks();
            }
        }

        // GET ALL TASKS
        private void GetTasks()
        {
            Repeater1.DataSource =
                taskService.GetAllTasks();

            Repeater1.DataBind();
        }

        // GET TASKS BY PRIORITY
        private void GetTasksByPriority(string priority)
        {
            Repeater1.DataSource =
                taskService.GetTasksByPriority(priority);

            Repeater1.DataBind();
        }
    }
}
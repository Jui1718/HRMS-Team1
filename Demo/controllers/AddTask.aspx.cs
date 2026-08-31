using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class AddTask : System.Web.UI.Page
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
            DropDownList1.DataSource = taskService.GetAllProjects();
            DropDownList1.DataTextField = "ProjectName";
            DropDownList1.DataValueField = "ProjectId";

            DropDownList1.DataBind();

            DropDownList1.Items.Insert(
                0,
                new ListItem(
                    "-- Select Project --",
                    "0"));
        }
        protected void DropDownList1_SelectedIndexChanged(
    object sender,
    EventArgs e)
        {
            int projectId = int.Parse(DropDownList1.SelectedValue);
            //string selectedValue = DropDownList1.SelectedValue;

            //Response.Write("<script>alert('Project ID = " + selectedValue + "');</script>");

            //int projectId = int.Parse(selectedValue);

            CheckBoxList1.Items.Clear();

            if (projectId > 0)
            {
                CheckBoxList1.DataSource = taskService.GetProjectMembers(projectId);

                CheckBoxList1.DataTextField = "MemberName";

                CheckBoxList1.DataValueField = "UserId";

                CheckBoxList1.DataBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Tasks task = new Tasks();

                task.ProjectId =
                   int.Parse(DropDownList1.SelectedValue);

                task.Title =
                    TextBox1.Text;

                task.Description =
                    TextBox3.Text;

                task.Status =
                    DropDownList2.SelectedValue;

                task.Priority =
                    DropDownList3.SelectedValue;

                task.DeadLine =
                    DateTime.Parse(TextBox2.Text);


                // to upload File
                if (FileUpload1.HasFile)
                {
                    string folderPath = Server.MapPath("~/Uploads/Tasks/");

                    if (!System.IO.Directory.Exists(folderPath))
                    {
                        System.IO.Directory.CreateDirectory(folderPath);
                    }

                    string fileName = System.IO.Path.GetFileName(FileUpload1.FileName);

                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + fileName;

                    FileUpload1.SaveAs(System.IO.Path.Combine(folderPath, uniqueFileName));

                    task.FilePath = "~/Uploads/Tasks/" + uniqueFileName;

                }
                else
                {
                    task.FilePath = "";
                }


                //      ADD TASK
                int taskId =
                    taskService.AddTask(task);


                // FETCH  SELECTED MEMBERS
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (item.Selected)
                    {
                        int userId = int.Parse(item.Value);
                        taskService.AddTaskMember(taskId,userId);
                    }
                }


                // AFTER ADDING TASK
                Response.Redirect("Task.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('" +
                    ex.Message.Replace("'", "") +
                    "');</script>");
            }
        }
    }
}
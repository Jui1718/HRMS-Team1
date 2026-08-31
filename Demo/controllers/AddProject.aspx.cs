using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class AddProject : System.Web.UI.Page
    {
        ProjectService projectService;

        protected void Page_Load(object sender, EventArgs e)
        {
            projectService = new ProjectService();

            if (!IsPostBack)
            {
                LoadManagers();
                LoadMembers();
            }
        }

        private void LoadManagers()
        {
            List<ProjectManager> managers = projectService.GetProjectManagers();

            DropDownList5.DataSource = managers;
            DropDownList5.DataTextField = "FirstName";
            DropDownList5.DataValueField = "UserId";
            DropDownList5.DataBind();
        }

        private void LoadMembers()
        {
            List<ProjectManager> members = projectService.GetMembers();

            CheckBoxList1.DataSource = members;
            CheckBoxList1.DataTextField = "FirstName";
            CheckBoxList1.DataValueField = "UserId";
            CheckBoxList1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string projectName = TextBox1.Text;
            string clientName = TextBox2.Text;
            string description = TextBox3.Text;

            DateTime startDate = DateTime.Parse(TextBox4.Text);
            DateTime endDate = DateTime.Parse(TextBox5.Text);

            string priority = DropDownList1.SelectedValue;

            decimal projectValue = decimal.Parse(TextBox6.Text);

            string priceType = DropDownList2.SelectedValue;

            string status = DropDownList3.SelectedValue;

            string managerName = DropDownList5.SelectedItem.Text;

            string logoPath = "";
            string filePath = "";

            // for uploading a logo
            if (FileUpload1.HasFile)
            {
                string logoFileName = Path.GetFileName(FileUpload1.FileName);

                string logoFolder = Server.MapPath("~/Uploads/Logos/");

                if (!Directory.Exists(logoFolder))
                {
                    Directory.CreateDirectory(logoFolder);
                }

                FileUpload1.SaveAs(Path.Combine(logoFolder, logoFileName));

                logoPath = "~/Uploads/Logos/" + logoFileName;
            }

            //to  Upload File
            if (FileUpload2.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload2.FileName);

                string fileFolder = Server.MapPath("~/Uploads/Files/");

                if (!Directory.Exists(fileFolder))
                {
                    Directory.CreateDirectory(fileFolder);
                }

                FileUpload2.SaveAs(Path.Combine(fileFolder, fileName));

                filePath = "~/Uploads/Files/" + fileName;
            }

            // add project
            int projectId = projectService.AddProject(
                projectName,
                clientName,
                description,
                startDate,
                endDate,
                priority,
                projectValue,
                priceType,
                filePath,
                logoPath,
                status,
                managerName
            );

            // select team members
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    int userId = int.Parse(item.Value);

                    projectService.AddProjectUser(projectId, userId);
                }
            }
            // AFTER ADDING PROJECT
            Response.Redirect("ProjectList.aspx");
        }
    }
}
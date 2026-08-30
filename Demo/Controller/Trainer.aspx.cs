using Demo.Model;
using Demo.Service;
using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class TrainerPage : System.Web.UI.Page
    {
        TrainerService service;
        RoleService roleService;

        private const string UploadFolder = "~/Uploads/TrainerProfiles/";

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new TrainerService();
            roleService = new RoleService();

            if (!IsPostBack)
            {
                BindRoleDropdown();
                FetchTrainer();
            }
            Pagination();
        }

        public void Pagination()
        {
            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.TableSection = TableRowSection.TableBody;
                }
            }
        }

        public void BindRoleDropdown()
        {
            var roles = roleService.FetchAll();

            ddlRole.DataSource = roles;
            ddlRole.DataTextField = "RoleName";
            ddlRole.DataValueField = "RoleName";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, new ListItem("Select Role", ""));
        }

        public void FetchTrainer()
        {
            var trainers = service.FetchAll();
            string dateFilter = ddlFilterByDate.SelectedValue;
            if (dateFilter == "today")
            {
                trainers = trainers.Where(t => t.CreatedDate.Date == DateTime.Today).ToList();
            }
            else if (dateFilter == "last7days")
            {
                trainers = trainers.Where(t => t.CreatedDate.Date >= DateTime.Today.AddDays(-7)).ToList();
            }
            else if (dateFilter == "lastmonth")
            {
                trainers = trainers.Where(t => t.CreatedDate.Date >= DateTime.Today.AddMonths(-1)).ToList();
            }

            if (ddlSortBy.SelectedValue == "desc")
            {
                trainers = trainers.OrderByDescending(p => p.FirstName).ToList();
            }
            else
            {
                trainers = trainers.OrderBy(p => p.FirstName).ToList();
            }
            GridView1.DataSource = trainers;
            GridView1.DataBind();
            Pagination();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string msg;
            string profilePicture = HiddenField2.Value;

            if (FileUpload1.HasFile)
            {
                profilePicture = SaveUploadedFile(FileUpload1);
            }

            var t = new Demo.Model.Trainer()
            {
                FirstName = TextBox1.Text,
                LastName = TextBox2.Text,
                Role = ddlRole.SelectedValue,
                Email = TextBox4.Text,
                Description = TextBox5.Text,
                Status = DropDownList1.SelectedValue,
                Phone = TextBox6.Text,
                ProfilePicture = profilePicture
            };

            if (Button1.Text == "Update")
            {
                t.TrainerId = int.Parse(HiddenField1.Value);
                msg = service.Update(t);
                Button1.Text = "Add";
            }
            else
            {
                msg = service.Add(t);
            }

            ClearForm();
            FetchTrainer();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        private string SaveUploadedFile(FileUpload fileUpload)
        {
            string folderPath = Server.MapPath(UploadFolder);

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            string extension = Path.GetExtension(fileUpload.FileName);
            string uniqueFileName = Guid.NewGuid().ToString() + extension;

            string fullPath = Path.Combine(folderPath, uniqueFileName);
            fileUpload.SaveAs(fullPath);

            return uniqueFileName;
        }

        private void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            ddlRole.ClearSelection();
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            DropDownList1.ClearSelection();
            HiddenField1.Value = "0";
            HiddenField2.Value = "";
            Image1.Visible = false;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int trainerId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditRow")
            {
                var obj = service.GetById(trainerId);

                BindRoleDropdown();

                TextBox1.Text = obj.FirstName;
                TextBox2.Text = obj.LastName;
                ddlRole.SelectedValue = obj.Role;
                TextBox4.Text = obj.Email;
                TextBox5.Text = obj.Description;
                DropDownList1.SelectedValue = obj.Status;
                TextBox6.Text = obj.Phone;

                HiddenField2.Value = obj.ProfilePicture;

                if (!string.IsNullOrEmpty(obj.ProfilePicture))
                {
                    Image1.ImageUrl = UploadFolder + obj.ProfilePicture;
                    Image1.Visible = true;
                }
                else
                {
                    Image1.Visible = false;
                }

                HiddenField1.Value = trainerId.ToString();
                Button1.Text = "Update";
                LitModalTitle.Text = "Edit Trainer";
                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_trainer')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteRow")
            {
                string msg = service.Delete(trainerId);

                FetchTrainer();

                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTrainer();
        }

        protected void ddlFilterByDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTrainer();
        }

        protected void btnAddTrainer_Click(object sender, EventArgs e)
        {
            // Reset everything so "Add" always starts clean, even after a cancelled edit
            ClearForm();
            Button1.Text = "Add";
            LitModalTitle.Text = "Add Trainer";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_trainer')); m.show(); };</script>");
        }

        public string GetStatusBadgeClass(string status)
        {
            switch (status)
            {
                case "Active":
                    return "bg-success";
                case "Inactive":
                    return "bg-danger";
                default:
                    return "bg-secondary";
            }
        }
    }
}
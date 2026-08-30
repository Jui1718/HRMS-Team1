using Demo.Model;
using Demo.Service;
using System;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class TrainingPage : System.Web.UI.Page
    {
        TrainingService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new TrainingService();

            if (!IsPostBack)
            {
                TrainerList();
                TrainingTypeList();
                EmployeeList();
                FetchTraining();
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

        private void TrainerList()
        {
            TrainerService trainerService = new TrainerService();
            var trainers = trainerService.FetchAll();

            DropDownList1.DataSource = trainers;
            DropDownList1.DataTextField = "FirstName";
            DropDownList1.DataValueField = "TrainerId";
            DropDownList1.DataBind();
        }

        private void TrainingTypeList()
        {
            TrainingTypeService trainingTypeService = new TrainingTypeService();
            var trainingTypes = trainingTypeService.FetchAll();

            DropDownList2.DataSource = trainingTypes;
            DropDownList2.DataTextField = "TrainingTypeName";
            DropDownList2.DataValueField = "TrainingTypeId";
            DropDownList2.DataBind();
        }

        private void EmployeeList()
        {
            EmployeeService employeeService = new EmployeeService();
            var employees = employeeService.FetchAll();

            DropDownList3.DataSource = employees;
            DropDownList3.DataTextField = "EmployeeName";
            DropDownList3.DataValueField = "EmployeeId";
            DropDownList3.DataBind();
        }

        public void FetchTraining()
        {
            var trainings = service.FetchAll();

            string dateFilter = ddlFilterByDate.SelectedValue;
            if (dateFilter == "today")
            {
                trainings = trainings.Where(t => t.StartDate.Date == DateTime.Today).ToList();
            }
            else if (dateFilter == "last7days")
            {
                trainings = trainings.Where(t => t.StartDate.Date >= DateTime.Today.AddDays(-7)).ToList();
            }
            else if (dateFilter == "lastmonth")
            {
                trainings = trainings.Where(t => t.StartDate.Date >= DateTime.Today.AddMonths(-1)).ToList();
            }

            if (ddlSortBy.SelectedValue == "desc")
            {
                trainings = trainings.OrderByDescending(t => t.StartDate).ToList();
            }
            else
            {
                trainings = trainings.OrderBy(t => t.StartDate).ToList();
            }

            GridView1.DataSource = trainings;
            GridView1.DataBind();
            Pagination();
        }

        public void SaveTraining()
        {
            int trainerId = int.Parse(DropDownList1.SelectedValue);
            int trainingTypeId = int.Parse(DropDownList2.SelectedValue);
            int employeeId = int.Parse(DropDownList3.SelectedValue);
            decimal trainingCost = decimal.Parse(TextBox1.Text);
            string description = TextBox2.Text;
            string status = DropDownList4.SelectedValue;

            DateTime startDate = DateTime.ParseExact(TextBox3.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = DateTime.ParseExact(TextBox4.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);

            var t = new Demo.Model.Training()
            {
                TrainerId = trainerId,
                TrainingTypeId = trainingTypeId,
                UserId = employeeId,
                TrainingCost = trainingCost,
                Description = description,
                Status = status,
                StartDate = startDate,
                EndDate = endDate
            };

            string msg;

            int trainingId = int.Parse(HiddenField1.Value);

            if (trainingId > 0)
            {
                t.TrainingId = trainingId;
                msg = service.Update(t);
                Button1.Text = "Add";
            }
            else
            {
                msg = service.Add(t);
            }

            ClearForm();
            FetchTraining();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        private void ClearForm()
        {
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            TextBox1.Text = "";
            TextBox2.Text = "";
            DropDownList4.ClearSelection();
            TextBox3.Text = "";
            TextBox4.Text = "";
            HiddenField1.Value = "0";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveTraining();
        }

        protected void btnAddTraining_Click(object sender, EventArgs e)
        {
            ClearForm();
            Button1.Text = "Add";
            LitModalTitle.Text = "Add Training";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_training')); m.show(); };</script>");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int trainingId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditRow")
            {
                var obj = service.GetById(trainingId);

                TrainerList();
                TrainingTypeList();
                EmployeeList();

                DropDownList1.SelectedValue = obj.TrainerId.ToString();
                DropDownList2.SelectedValue = obj.TrainingTypeId.ToString();
                DropDownList3.SelectedValue = obj.UserId.ToString();
                TextBox1.Text = obj.TrainingCost.ToString();
                TextBox2.Text = obj.Description;
                DropDownList4.SelectedValue = obj.Status;
                TextBox3.Text = obj.StartDate.ToString("dd/MM/yyyy");
                TextBox4.Text = obj.EndDate.ToString("dd/MM/yyyy");

                HiddenField1.Value = trainingId.ToString();
                Button1.Text = "Update";
                LitModalTitle.Text = "Edit Training";

                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_training')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteRow")
            {
                string msg = service.Delete(trainingId);

                FetchTraining();

                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTraining();
        }

        protected void ddlFilterByDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTraining();
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
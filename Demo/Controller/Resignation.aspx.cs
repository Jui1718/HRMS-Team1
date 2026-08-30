using Demo.Model;
using Demo.Service;
using System;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class Resignation : System.Web.UI.Page
    {
        ResignationService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new ResignationService();

            if (!IsPostBack)
            {
                EmpList();
                DepartmentList();
                FetchResignation();
            }
            Pagination();
        }

        public void Pagination()
        {
            if (GridView2.Rows.Count > 0)
            {
                GridView2.UseAccessibleHeader = true;
                GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
                foreach (GridViewRow row in GridView2.Rows)
                {
                    row.TableSection = TableRowSection.TableBody;
                }
            }
        }

        private void EmpList()
        {
            EmployeeService employeeService = new EmployeeService();
            var employee = employeeService.FetchAll();

            DropDownList1.DataSource = employee;
            DropDownList1.DataTextField = "EmployeeName";
            DropDownList1.DataValueField = "EmployeeId";
            DropDownList1.DataBind();
        }

        private void DepartmentList()
        {
            OrganizationService orgService = new OrganizationService();
            var departments = orgService.GetAll();

            DropDownList2.DataSource = departments;
            DropDownList2.DataTextField = "DepartmentName";
            DropDownList2.DataValueField = "DepartmentId";
            DropDownList2.DataBind();
        }

        public void FetchResignation()
        {
            var resignations = service.FetchAll();

            string dateFilter = ddlFilterByDate.SelectedValue;
            if (dateFilter == "today")
            {
                resignations = resignations.Where(p => p.NoticeDate.Date == DateTime.Today).ToList();
            }
            else if (dateFilter == "last7days")
            {
                resignations = resignations.Where(p => p.NoticeDate.Date >= DateTime.Today.AddDays(-7)).ToList();
            }
            else if (dateFilter == "lastmonth")
            {
                resignations = resignations.Where(p => p.NoticeDate.Date >= DateTime.Today.AddMonths(-1)).ToList();
            }

            if (ddlSortBy.SelectedValue == "desc")
            {
                resignations = resignations.OrderByDescending(p => p.EmployeeName).ToList();
            }
            else
            {
                resignations = resignations.OrderBy(p => p.EmployeeName).ToList();
            }

            GridView2.DataSource = resignations;
            GridView2.DataBind();
            Pagination();
        }

        public void SaveResignation()
        {
            int employeeId = int.Parse(DropDownList1.SelectedValue);
            int departmentId = int.Parse(DropDownList2.SelectedValue);
            DateTime noticeDate = DateTime.ParseExact(TextBox1.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime resignDate = DateTime.ParseExact(TextBox2.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string reason = TextBox3.Text;

            var r = new Demo.Model.Resignation()
            {
                UserID = employeeId,
                DepartmentId = departmentId,
                NoticeDate = noticeDate,
                ResignDate = resignDate,
                Reason = reason
            };

            string msg;
            int resignationId = int.Parse(HiddenField1.Value);

            if (resignationId > 0)
            {
                r.ResignationId = resignationId;
                msg = service.Update(r);
                Button1.Text = "Add";
            }
            else
            {
                msg = service.Add(r);
            }

            FetchResignation();
            ClearForm();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        private void ClearForm()
        {
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            HiddenField1.Value = "0";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveResignation();
        }

        protected void btnAddResignation_Click(object sender, EventArgs e)
        {
            ClearForm();
            Button1.Text = "Add";
            LitModalTitle.Text = "Add Resignation";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_resignation')); m.show(); };</script>");
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchResignation();
        }

        protected void ddlFilterByDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchResignation();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int resignationId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditRow")
            {
                var obj = service.GetById(resignationId);

                DropDownList1.SelectedValue = obj.UserID.ToString();
                DropDownList2.SelectedValue = obj.DepartmentId.ToString();
                TextBox1.Text = obj.NoticeDate.ToString("dd/MM/yyyy");
                TextBox2.Text = obj.ResignDate.ToString("dd/MM/yyyy");
                TextBox3.Text = obj.Reason;

                HiddenField1.Value = resignationId.ToString();
                Button1.Text = "Update";

                LitModalTitle.Text = "Edit Resignation";
                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_resignation')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteRow")
            {
                string msg = service.Delete(resignationId);

                FetchResignation();

                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
        }
    }
}
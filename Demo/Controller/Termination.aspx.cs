using Demo.Model;
using Demo.Service;
using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class Termination : System.Web.UI.Page
    {
        TerminationService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new TerminationService();

            if (!IsPostBack)
            {
                EmpList();
                FetchTermination();
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

        private void EmpList()
        {
            EmployeeService employeeService = new EmployeeService();
            var employee = employeeService.FetchAll();

            DropDownList1.DataSource = employee;
            DropDownList1.DataTextField = "EmployeeName";
            DropDownList1.DataValueField = "EmployeeId";
            DropDownList1.DataBind();
        }

        public void FetchTermination()
        {
            var terminations = service.FetchAll();
            string dateFilter = ddlFilterByDate.SelectedValue;
            if (dateFilter == "today")
            {
                terminations = terminations.Where(p => p.NoticeDate.Date  == DateTime.Today).ToList();
            }
            else if (dateFilter == "last7days")
            {
                terminations = terminations.Where(p => p.NoticeDate.Date >= DateTime.Today.AddDays(-7)).ToList();
            }
            else if (dateFilter == "lastmonth")
            {
                terminations = terminations.Where(p => p.NoticeDate.Date >= DateTime.Today.AddMonths(-1)).ToList();
            }

            if (ddlSortBy.SelectedValue == "desc")
            {
                terminations = terminations.OrderByDescending(p => p.EmployeeName).ToList();
            }
            else
            {
                terminations = terminations.OrderBy(p => p.EmployeeName).ToList();
            }

            GridView1.DataSource = terminations;
            GridView1.DataBind();
            Pagination();
        }

        public void SaveTermination()
        {
            int employeeId = int.Parse(DropDownList1.SelectedValue);
            string terminationType = DropDownList2.SelectedValue;
            DateTime noticeDate = DateTime.Parse(TextBox2.Text.Trim());
            DateTime resignDate = DateTime.Parse(TextBox3.Text.Trim());
            string reason = TextBox4.Text;

            var t = new Demo.Model.Termination()
            {
                UserID = employeeId,
                TerminationType = terminationType,
                NoticeDate = noticeDate,
                ResignDate = resignDate,
                Reason = reason
            };

            //if (FileUpload1.HasFile)
            //{
            //    string uniqueName = Guid.NewGuid() + Path.GetExtension(FileUpload1.FileName);
            //    FileUpload1.SaveAs(Server.MapPath("~/Images/") + uniqueName);
            //    t.AttachmentPath = "Images/" + uniqueName;
            //}

            string msg;
            int terminationId = int.Parse(HiddenField1.Value);

            if (terminationId > 0)
            {
                t.TerminationId = terminationId;
                msg = service.Update(t);
                Button1.Text = "Add";
            }
            else
            {
                msg = service.Add(t);
            }

            FetchTermination();
            ClearForm();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        private void ClearForm()
        {
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            HiddenField1.Value = "0";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveTermination();
        }

        protected void btnAddTermination_Click(object sender, EventArgs e)
        {
            ClearForm();
            Button1.Text = "Add";
            LitModalTitle.Text = "Add Termination";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_termination')); m.show(); };</script>");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int terminationId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditRow")
            {
                var obj = service.FetchById(terminationId);

                DropDownList1.SelectedValue = obj.UserID.ToString();
                DropDownList2.SelectedValue = obj.TerminationType;
                TextBox2.Text = obj.NoticeDate.ToString("dd/MM/yyyy");
                TextBox3.Text = obj.ResignDate.ToString("dd/MM/yyyy");
                TextBox4.Text = obj.Reason;

                HiddenField1.Value = terminationId.ToString();
                Button1.Text = "Update";

                LitModalTitle.Text = "Edit Termination";
                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_termination')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteRow")
            {
                string msg = service.Delete(terminationId);

                FetchTermination();

                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTermination();
        }

        protected void ddlFilterByDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTermination();
        }
    }
}
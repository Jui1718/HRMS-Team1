using Demo.Service;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Demo.Model;

namespace Demo.Controller
{
    public partial class Promotion : System.Web.UI.Page
    {
        PromotionService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new PromotionService();

            if (!IsPostBack)
            {
                EmpList();
                DesignationList();
                FetchPromotion();
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

        public void DesignationList()
        {
            DesignationService designationService = new DesignationService();
            var designation = designationService.GetAll();

            DropDownList2.DataSource = designation;
            DropDownList2.DataTextField = "DesignationName";
            DropDownList2.DataValueField = "DesignationId";
            DropDownList2.DataBind();

            DropDownList3.DataSource = designation;
            DropDownList3.DataTextField = "DesignationName";
            DropDownList3.DataValueField = "DesignationId";
            DropDownList3.DataBind();
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

        public void FetchPromotion()
        {
            var promotion = service.FetchAll();
            string dateFilter = ddlFilterByDate.SelectedValue;
            if (dateFilter == "today")
            {
                promotion = promotion.Where(p => p.PromotionDate.Date == DateTime.Today).ToList();
            }
            else if (dateFilter == "last7days")
            {
                promotion = promotion.Where(p => p.PromotionDate.Date >= DateTime.Today.AddDays(-7)).ToList();
            }
            else if (dateFilter == "lastmonth")
            {
                promotion = promotion.Where(p => p.PromotionDate.Date >= DateTime.Today.AddMonths(-1)).ToList();
            }

            if (ddlSortBy.SelectedValue == "desc")
            {
                promotion = promotion.OrderByDescending(p => p.EmployeeName).ToList();
            }
            else
            {
                promotion = promotion.OrderBy(p => p.EmployeeName).ToList();
            }

            GridView1.DataSource = promotion;
            GridView1.DataBind();
            Pagination();
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchPromotion();
        }

        protected void ddlFilterByDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchPromotion();
        }

        public void SavePromotion()
        {
            int employeeId = int.Parse(DropDownList1.SelectedValue);
            string designationFrom = DropDownList2.SelectedItem.Text;
            string designationTo = DropDownList3.SelectedItem.Text;
            DateTime promotionDate = DateTime.ParseExact(TextBox1.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);

            var p = new Demo.Model.Promotion()
            {
                UserID = employeeId,
                DesignationFrom = designationFrom,
                DesignationTo = designationTo,
                PromotionDate = promotionDate
            };

            string msg;
            int promotionId = int.Parse(HiddenField1.Value);

            if (promotionId > 0)
            {
                p.PromotionId = promotionId;
                msg = service.Update(p);
                Button1.Text = "Add";
            }
            else
            {
                msg = service.Add(p);
            }

            FetchPromotion();
            ClearForm();

            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
        }

        private void ClearForm()
        {
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            TextBox1.Text = string.Empty;
            HiddenField1.Value = "0";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SavePromotion();
        }

        protected void btnAddPromotion_Click(object sender, EventArgs e)
        {
            ClearForm();
            Button1.Text = "Add";
            LitModalTitle.Text = "Add Promotion";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_promotion')); m.show(); };</script>");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int promotionId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditRow")
            {
                var obj = service.GetById(promotionId);

                DropDownList1.SelectedValue = obj.UserID.ToString();

                DropDownList2.ClearSelection();
                DropDownList2.Items.FindByText(obj.DesignationFrom).Selected = true;

                DropDownList3.ClearSelection();
                DropDownList3.Items.FindByText(obj.DesignationTo).Selected = true;

                TextBox1.Text = obj.PromotionDate.ToString("dd/MM/yyyy");

                HiddenField1.Value = promotionId.ToString();
                Button1.Text = "Update";

                LitModalTitle.Text = "Edit Promotion";
                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_promotion')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteRow")
            {
                string msg = service.Delete(promotionId);

                FetchPromotion();

                ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", $"alert('{msg}');", true);
            }
        }
    }
}